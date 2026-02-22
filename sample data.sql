-- Patients
INSERT INTO Patients (PatientName, Age, Gender, Phone, Address) VALUES
('Asha Kumar', 35, 'Male', '9876543210', 'Chennai'),
('Ravi Singh', 30, 'Male', '9876543222', 'Bangalore'),
('Anu', 28, 'Female', '9874541210', 'CBE'),
('Priyar', 32, 'Female', '99765435216', 'Tirupur'),
('Malar', 25, 'Female', '9076513222', 'Salem'),
('Siva', 27, 'Male', '9776543100', 'Tirupur'),
('Bala', 33, 'Male', '92765432715', 'Chennai'),
('Monika', 25, 'Female', '8876543222', 'Bangalore'),
('Sanjay', 36, 'Male', '88765432444', 'Erode'),
('Sandthiya', 24, 'Female', '8976543568', 'CBE');

-- Doctors
INSERT INTO Doctors (DoctorName, Specialization, Phone) VALUES
('Priya Reddy', 'Cardiology', '9000000001'),
('Arun Patel', 'Orthopaedics', '9000000002'),
('Sumathi', 'Physiotherapy', '9000000003'),
('Arun Patel', 'Terminology', '9000000004');

-- Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate) VALUES
(1, 1, '2025-05-05'),
(2, 2, '2025-10-06'),
(3, 3, '2025-08-07'),
(4, 4, '2025-11-05'),
(5, 1, '2025-10-06'),
(6, 3, '2025-09-07'),
(7, 4, '2025-10-18'),
(8, 2, '2025-10-25'),
(9, 3, '2025-10-28'),
(10, 1, '2025-10-29');

-- Treatments
INSERT INTO Treatments (PatientID, DoctorID, Description, Cost) VALUES
(1, 1, 'ECG Test', 1200.00),
(2, 2, 'X-Ray', 800.00),
(4, 4, 'API', 3500.00),
(6, 3, 'Special Test', 2500.00),
(8, 2, 'X-Ray', 800.00),
(10, 1, 'Blood Test', 1500.00);