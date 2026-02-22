START TRANSACTION;

-- Update Patient Name
UPDATE Patients SET PatientName = 'Lally' WHERE PatientID = 5;

-- Savepoint
SAVEPOINT sp1;

-- Another Update
UPDATE Patients SET PatientName = 'Malar Updated' WHERE PatientID = 5;

-- Rollback to Savepoint
ROLLBACK TO sp1;

-- Commit
COMMIT;

-- Check result
SELECT PatientID, PatientName FROM Patients WHERE PatientID = 5;
