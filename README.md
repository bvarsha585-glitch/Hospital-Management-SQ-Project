# Hospital-Management-SQL-Project
SQL-based analysis of hospital operations including patients, doctors, appointments, and billing to extract insights on workload, patient flow, and revenue.

## Tools Used
- MySQL
- Workbench
- 
## Concepts Implemented

SQL Basics: SELECT, WHERE, GROUP BY, ORDER BY

Joins: INNER JOIN, LEFT JOIN, RIGHT JOIN, UNION

Advanced SQL:

Subqueries

Stored Procedures

User-Defined Functions

Ranking Functions (RANK, DENSE_RANK, ROW_NUMBER)

Indexing: Unique & Composite Indexes

Views: Summarized patient, doctor, and treatment information

Transaction Control: SAVEPOINT, ROLLBACK, COMMIT
## Database Structure
**Entities & Tables:
-Doctors: DoctorID, Name, Specialization, Phone
-Appointments: AppointmentID, PatientID, DoctorID, AppointmentDate, Status
-Treatments: TreatmentID, PatientID, DoctorID, Description, Cost
-Invoices: InvoiceID, PatientID, TreatmentID, TotalAmount, InvoiceDate, Status

## Features
- Manage patients, doctors, appointments, treatments, and billing efficiently
- Automate billing with functions and stored procedures
- Rank doctors by workload and total treatment cost
- Ensure data integrity using transaction control
- Optimize query performance with indexes and views

## Sample Queries
- Display appointment details along with patient and doctor names using **INNER JOIN**
- List all doctors even if they don’t have appointments (**RIGHT JOIN**)
- Combine patient lists from appointments and treatments without duplicates (**UNION**)
- Generate billing status per patient using a **User-Defined Function**
- Generate invoices automatically using **Stored Procedures**
- Rank doctors by total treatment cost (**RANK**, **DENSE_RANK**, **ROW_NUMBER**)
- Transaction control demo using **SAVEPOINT**, **ROLLBACK**, and **COMMIT**

## How to Run

1. **Install MySQL**
   - Download and install MySQL Server: [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)
   - Install MySQL Workbench (optional) for GUI.

2. git clone https://github.com/Varsha585/Hospital-Management-SQL.git
cd Hospital-Management-SQL

## set data base
CREATE DATABASE hospitaldb;
use hospitaldb;

SOURCE schema.sql;        -- Create tables
SOURCE sample data.sql;   -- Insert sample data
SOURCE queries.sql;       -- Run example queries
SOURCE views.sql;         -- Create views
SOURCE indexes.sql;       -- Create indexes
SOURCE transactions.sql;  -- Run transactions



   
