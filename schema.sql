-- Patients Table
CREATE TABLE Patients (
  PatientID INT PRIMARY KEY AUTO_INCREMENT,
  PatientName VARCHAR(100) NOT NULL,
  Age INT,
  Gender ENUM('Male','Female','Other') DEFAULT 'Other',
  Phone VARCHAR(15),
  Address VARCHAR(200)
);

-- Doctors Table
CREATE TABLE Doctors (
  DoctorID INT PRIMARY KEY AUTO_INCREMENT,
  DoctorName VARCHAR(100) NOT NULL,
  Specialization VARCHAR(50),
  Phone VARCHAR(15)
);

-- Appointments Table
CREATE TABLE Appointments (
  AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
  PatientID INT,
  DoctorID INT,
  AppointmentDate DATE,
  Status ENUM('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
  FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Treatments Table
CREATE TABLE Treatments (
  TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
  PatientID INT,
  DoctorID INT,
  Description VARCHAR(200),
  Cost DECIMAL(10,2),
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
  FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Invoices Table
CREATE TABLE Invoices (
  InvoiceID INT PRIMARY KEY AUTO_INCREMENT,
  PatientID INT,
  TreatmentID INT,
  TotalAmount DECIMAL(10,2),
  InvoiceDate DATE,
  Status ENUM('Unpaid','Partial','Paid') DEFAULT 'Unpaid',
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
  FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);


