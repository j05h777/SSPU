create database hospital_dw;
use hospital_dw;

CREATE TABLE DimPatient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT
);
CREATE TABLE DimDoctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    Specialization VARCHAR(100)
);
CREATE TABLE DimHospital (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(100),
    City VARCHAR(50)
);
CREATE TABLE DimDate (
    DateID INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Quarter INT,
    Month INT,
    Day INT
);
CREATE TABLE FactTreatment (
    TreatmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    HospitalID INT,
    DateID INT,
    TreatmentType VARCHAR(100),
    TotalCost DECIMAL(10,2),

    FOREIGN KEY (PatientID) REFERENCES DimPatient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES DimDoctor(DoctorID),
    FOREIGN KEY (HospitalID) REFERENCES DimHospital(HospitalID),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID)
);
INSERT INTO DimPatient VALUES
(1, 'Rahul Sharma', 'Male', 25),
(2, 'Priya Patil', 'Female', 32),
(3, 'Amit Kumar', 'Male', 45),
(4, 'Sneha Joshi', 'Female', 28),
(5, 'Rohan Mehta', 'Male', 51);

INSERT INTO DimDoctor VALUES
(1, 'Dr. Anil Deshmukh', 'Cardiology'),
(2, 'Dr. Neha Kulkarni', 'Neurology'),
(3, 'Dr. Raj Malhotra', 'Orthopedics'),
(4, 'Dr. Pooja Shah', 'Pediatrics'),
(5, 'Dr. Vikram Singh', 'General Medicine');

INSERT INTO DimHospital VALUES
(1, 'City Care Hospital', 'Pune'),
(2, 'Apollo Hospital', 'Mumbai'),
(3, 'Ruby Hall Clinic', 'Pune'),
(4, 'Fortis Hospital', 'Bangalore'),
(5, 'Global Hospital', 'Hyderabad');

INSERT INTO DimDate VALUES
(1, '2026-01-10', 2026, 1, 1, 10),
(2, '2026-02-15', 2026, 1, 2, 15),
(3, '2026-03-20', 2026, 1, 3, 20),
(4, '2026-04-05', 2026, 2, 4, 5),
(5, '2026-05-12', 2026, 2, 5, 12);

INSERT INTO FactTreatment VALUES
(1, 1, 1, 1, 1, 'Heart Checkup', 15000),
(2, 2, 2, 2, 2, 'MRI Scan', 25000),
(3, 3, 3, 3, 3, 'Fracture Treatment', 18000),
(4, 4, 4, 4, 4, 'Child Consultation', 8000),
(5, 5, 5, 5, 5, 'General Checkup', 5000),
(6, 1, 1, 2, 1, 'ECG', 7000),
(7, 2, 2, 3, 2, 'Neurology Consultation', 12000),
(8, 3, 3, 1, 3, 'Bone Treatment', 16000),
(9, 4, 4, 5, 4, 'Pediatric Consultation', 6000),
(10, 5, 5, 4, 5, 'Blood Test', 4000);

SHOW TABLES;

DESC DimPatient;
DESC DimDoctor;
DESC DimHospital;
DESC DimDate;
DESC FactTreatment;
		
SELECT * FROM DimPatient;
SELECT * FROM DimDoctor;
SELECT * FROM DimHospital;
SELECT * FROM DimDate;
SELECT * FROM FactTreatment;

ALTER TABLE DimDate
ADD MonthName VARCHAR(20);

UPDATE DimDate
SET MonthName = MONTHNAME(FullDate)
WHERE DateID>0;