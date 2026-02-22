-- INNER JOIN – Appointments with Patient & Doctor Names
SELECT a.AppointmentID, p.PatientName, d.DoctorName, a.AppointmentDate
FROM Appointments a
INNER JOIN Patients p ON a.PatientID = p.PatientID
INNER JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- RIGHT JOIN – All Doctors Even If No Appointments 
SELECT d.DoctorID, d.DoctorName, a.AppointmentID, a.AppointmentDate
FROM Doctors d
RIGHT JOIN Appointments a ON d.DoctorID = a.DoctorID;

-- LEFT JOIN

SELECT a.AppointmentID, p.PatientName, d.DoctorName, t.TreatmentID, t.Description
FROM Appointments a
LEFT JOIN Patients p ON a.PatientID = p.PatientID
LEFT JOIN Doctors d ON a.DoctorID = d.DoctorID
LEFT JOIN Treatments t ON a.PatientID = t.PatientID;

-- UNION – Patients with Appointments OR Treatments
SELECT PatientID, PatientName FROM Patients
WHERE PatientID IN (SELECT PatientID FROM Appointments)
UNION
SELECT PatientID, PatientName FROM Patients
WHERE PatientID IN (SELECT PatientID FROM Treatments);


-- User-Defined Function – Bill Status

DELIMITER $$

CREATE FUNCTION BILL_1(P_ID INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE total_cost DECIMAL(10,2);
    DECLARE bill_status VARCHAR(50);

    SELECT COALESCE(SUM(Cost),0) INTO total_cost
    FROM Treatments
    WHERE PatientID = P_ID;

    IF total_cost = 0 THEN
        SET bill_status = 'No Treatment Found';
    ELSEIF total_cost < 1000 THEN
        SET bill_status = 'Low Bill';
    ELSEIF total_cost BETWEEN 1000 AND 3000 THEN
        SET bill_status = 'Medium Bill';
    ELSE
        SET bill_status = 'High Bill';
    END IF;

    RETURN bill_status;
END $$

DELIMITER ;

-- Test Function
SELECT PatientID, BILL_1(PatientID) AS Bill_Status FROM Patients;

-- Stored Procedure – Generate Invoice
DELIMITER $$

CREATE PROCEDURE GenerateInvoice(IN in_PatientID INT)
BEGIN
    DECLARE total_bill DECIMAL(10,2);

    SELECT COALESCE(SUM(Cost),0) INTO total_bill
    FROM Treatments
    WHERE PatientID = in_PatientID;

    IF total_bill > 0 THEN
        INSERT INTO Invoices (PatientID, TreatmentID, TotalAmount, InvoiceDate, Status)
        SELECT in_PatientID, TreatmentID, total_bill, CURDATE(), 'Unpaid'
        FROM Treatments WHERE PatientID = in_PatientID;
    END IF;

    SELECT P.PatientID, P.PatientName, T.TreatmentID, T.Description AS Treatment, T.Cost AS TreatmentCost, total_bill AS TotalBill
    FROM Patients P
    JOIN Treatments T ON P.PatientID = T.PatientID
    WHERE P.PatientID = in_PatientID;
END $$

DELIMITER ;

-- Test Procedure
CALL GenerateInvoice(1);

-- Ranking – Doctors by Total Treatment Cost
SELECT d.DoctorID, d.DoctorName, SUM(t.Cost) AS TotalTreatmentCost,
       RANK() OVER (ORDER BY SUM(t.Cost) DESC) AS DoctorRank
FROM Doctors d
JOIN Treatments t ON d.DoctorID = t.DoctorID
GROUP BY d.DoctorID, d.DoctorName;

-- View – Summarize Patient, Doctor, Total Cost

CREATE VIEW PatientDoctorSummary AS
SELECT p.PatientID, p.PatientName, d.DoctorID, d.DoctorName, 
       SUM(t.Cost) AS TotalTreatmentCost
FROM Patients p
JOIN Treatments t ON p.PatientID = t.PatientID
JOIN Doctors d ON t.DoctorID = d.DoctorID
GROUP BY p.PatientID, p.PatientName, d.DoctorID, d.DoctorName;