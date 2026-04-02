### Hospital Management System (SQL Project)
Project Overview

This project is a SQL-based Hospital Management System designed to manage and analyze hospital operations including patients, doctors, appointments, treatments, and billing.

It helps in understanding patient flow, doctor workload, and revenue generation using structured SQL queries..

### Objectives
Manage patient and doctor data efficiently
Track appointments and treatments
Automate billing processes
Perform data analysis using SQL
Extract insights on hospital operations

## Tools Used
- MySQL
- MySQL Workbench
- 
## Concepts Implemented

SQL Basics: SELECT, WHERE, GROUP BY, ORDER BY
Joins: INNER JOIN, LEFT JOIN, RIGHT JOIN, UNION
Subqueries
Stored Procedures
User-Defined Functions
Ranking Functions (RANK, DENSE_RANK, ROW_NUMBER)
Indexing (Unique & Composite)
Views
Transaction Control (SAVEPOINT, ROLLBACK, COMMIT)


## Database Structure
Entities & Tables
Doctors: DoctorID, Name, Specialization, Phone
Appointments: AppointmentID, PatientID, DoctorID, AppointmentDate, Status
Treatments: TreatmentID, PatientID, DoctorID, Description, Cost
Invoices: InvoiceID, PatientID, TreatmentID, TotalAmount, InvoiceDate, Status


## How to Run

### 1. Install MySQL
- Download and install **MySQL Server**: https://dev.mysql.com/downloads/mysql/
- Install **MySQL Workbench** (optional, for GUI).

### 2. Clone the Repository

git clone https://github.com/bvarsha585-glitch/Hospital-Management-SQL-Project.git
cd Hospital-Management-SQL-Project

## set data base
CREATE DATABASE hospitaldb;
use hospitaldb;

SOURCE schema.sql;        -- Create tables
SOURCE sample data.sql;   -- Insert sample data
SOURCE queries.sql;       -- Run example queries
SOURCE views.sql;         -- Create views
SOURCE indexes.sql;       -- Create indexes
SOURCE transactions.sql;  -- Run transactions


## Features
- Manage patients, doctors, appointments, treatments, and billing efficiently
- Automate billing with functions and stored procedures
- Rank doctors by workload and total treatment cost
- Ensure data integrity using transaction control
- Optimize query performance with indexes and views


## Sample Queries
-- View all patients SELECT * FROM patients;
-- Count appointments per doctor SELECT doctor_id, COUNT(*) FROM appointments GROUP BY doctor_id;

## Key Insights
Helps track hospital operations efficiently
Identifies high workload doctors
Monitors revenue and billing status
Useful for real-world database systems


## screen shot/
  ##inner join
  innerjoin.png
## left join
  leftjoin.png
## right join
  rightjoin.png
## strored procedure
  storedprocedure.png
##transaction
   transaction.png

## Future Scope
Integrate with frontend (Web / Python)
Real-time database connection
Add dashboards using Power BI
Cloud deployment
   
## Project Structure
Hospital-Management-SQL-Project/

├── sql/
│   ├── schema.sql
│   ├── sample data.sql
│   ├── queries.sql
│   ├── views.sql
│   ├── indexes.sql
│   └── transactions.sql
│
├── images/
│   ├── innerjoin.png
│   ├── leftjoin.png
│   ├── rightjoin.png
│   ├── storedprocedure.png
│   └── transaction.png
│
└── README.md
   
