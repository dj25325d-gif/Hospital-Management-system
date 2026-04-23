CREATE DATABASE hospital_management;
USE hospital_management;

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    gender VARCHAR(20),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    registration_date DATE
);

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    available_days VARCHAR(100),
    consultation_fee DECIMAL(10, 2)
);

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE
);

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);

CREATE TABLE Medical_Records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis TEXT,
    prescription TEXT,
    treatment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);

CREATE TABLE Billing (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10, 2),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);

INSERT INTO Patients (name, dob, gender, phone_number, email, address, registration_date) VALUES
('OM Varma', '1985-06-15', 'Male', '1111111111', 'om.varma@email.com', 'Surat', '2023-01-10'),
('Reena Patil', '1990-09-22', 'Female', '2222222222', 'reena.patil@email.com', 'Surat', '2023-11-05'),
('Dhruv Mehra', '1975-12-03', 'Male', '3333333333', 'dhruv.mehra@email.com', 'Surat', '2024-02-20'),
('Krish Jain', '1988-03-12', 'Female', '4444444444', 'krish.jain@email.com', 'Surat', '2023-06-10'),
('Karan Shah', '1992-07-25', 'Male', '5555555555', 'karan.shah@email.com', 'Ahmedabad', '2022-11-15'),
('Simran Kaur', '1995-01-30', 'Female', '6666666666', 'simran.kaur@email.com', 'Delhi', '2024-01-05'),
('Rohit Verma', '1980-09-18', 'Male', '7777777777', 'rohit.verma@email.com', 'Mumbai', '2023-02-20'),
('Anjali Mehta', '1999-04-10', 'Female', '8888888888', 'anjali.mehta@email.com', 'Pune', '2023-08-01'),
('Vikas Yadav', '1978-12-11', 'Male', '9999999999', 'vikas.yadav@email.com', 'Lucknow', '2022-05-15'),
('Sneha Singh', '1993-06-22', 'Female', '9000000001', 'sneha.singh@email.com', 'Jaipur', '2024-03-12');

INSERT INTO Doctors (name, specialization, phone_number, email, available_days, consultation_fee) VALUES
('Dr. Milan Kapoor', 'Cardiology', '1111111119', 'milan.kapoor@hospital.com', 'Mon-Wed-Fri', 1200),
('Dr. Divyesh Mehta', 'Dermatology', '2222222229', 'divyesh.mehta@hospital.com', 'Tue-Thu', 800),
('Dr. Girish Patil', 'Neurology', '3333333339', 'girish.patil@hospital.com', 'Mon-Fri', 1500),
('Dr. Hitesh Sharma', 'Orthopedics', '4444444449', 'hitesh.sharma@hospital.com', 'Mon-Fri', 1000),
('Dr. Manshi Patel', 'Pediatrics', '5555555559', 'manshi.patel@hospital.com', 'Tue-Sat', 900);

INSERT INTO Departments (department_name) VALUES
('Cardiology'),
('Dermatology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('Gynecology'),
('General'),
('ENT');

INSERT INTO Doctor_Department VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2024-03-01', 'Completed'),
(2, 2, '2024-04-15', 'Scheduled'),
(3, 3, '2023-05-10', 'Cancelled'),
(4, 1, '2023-07-10', 'Completed'),
(5, 2, '2023-08-12', 'Completed'),
(6, 3, '2024-01-15', 'Scheduled'),
(7, 4, '2023-03-22', 'Cancelled'),
(8, 5, '2024-02-05', 'Completed'),
(9, 1, '2024-03-10', 'Scheduled'),
(10, 2, '2023-12-25', 'Completed');

INSERT INTO Medical_Records (patient_id, doctor_id, diagnosis, prescription, treatment_date) VALUES
(1, 1, 'Headache', 'Aspirin', '2024-03-01'),
(1, 1, 'Nausea', 'Aspirin', '2024-04-01'),
(2, 2, 'Skin Allergy', 'Cream', '2024-04-15'),
(3, 3, 'Migraine', 'Tablet', '2023-05-10'),
(4, 1, 'Checkup', 'None', '2023-07-10'),
(5, 2, 'Acne', 'Gel', '2023-08-12'),
(6, 3, 'Headache', 'Tablet', '2024-01-15'),
(7, 4, 'Fracture', 'Cast', '2023-03-22'),
(8, 5, 'Fever', 'Syrup', '2024-02-05'),
(9, 1, 'Recovery', 'Vitamins', '2024-03-10');

INSERT INTO Billing (patient_id, appointment_id, amount, payment_status, payment_date) VALUES
(1, 1, 1200, 'Paid', '2024-03-01'),
(2, 2, 800, 'Pending', NULL),
(3, 3, 1500, 'Cancelled', NULL),
(4, 4, 1200, 'Paid', '2023-07-10'),
(5, 5, 800, 'Paid', '2023-08-12'),
(6, 6, 1500, 'Pending', NULL),
(7, 7, 900, 'Cancelled', NULL),
(8, 8, 1100, 'Paid', '2024-02-05'),
(9, 9, 1300, 'Paid', '2024-03-10'),
(10, 10, 700, 'Paid', '2023-12-25');

INSERT INTO Patients (name, dob, gender) VALUES ('Test Patient', '2000-01-01', 'Male');

UPDATE Patients SET address = 'Updated Address' WHERE patient_id = 1;

DELETE FROM Appointments WHERE status = 'Cancelled' AND appointment_date < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

SELECT * FROM Patients WHERE YEAR(registration_date) = YEAR(CURDATE()) - 1;

SELECT p.name, SUM(b.amount) AS Total_Paid FROM Patients p 
JOIN Billing b ON p.patient_id = b.patient_id 
WHERE b.payment_status = 'Paid' GROUP BY p.patient_id, p.name ORDER BY Total_Paid DESC LIMIT 5;

SELECT name, consultation_fee FROM Doctors WHERE consultation_fee > 1000;

SELECT * FROM Appointments WHERE status = 'Scheduled' AND doctor_id = 3;

SELECT * FROM Doctors WHERE specialization = 'Cardiology' OR specialization = 'Neurology';

SELECT * FROM Patients 
WHERE patient_id NOT IN (
    SELECT DISTINCT patient_id 
    FROM Appointments 
    WHERE appointment_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) 
    AND status = 'Completed'
);

SELECT * FROM Doctors ORDER BY specialization ASC;

SELECT d.name, COUNT(DISTINCT a.patient_id) AS Patient_Count FROM Doctors d 
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id GROUP BY d.doctor_id, d.name;

SELECT dep.department_name, SUM(b.amount) AS Total_Revenue FROM Departments dep 
INNER JOIN Doctor_Department dd ON dep.department_id = dd.department_id 
INNER JOIN Appointments a ON dd.doctor_id = a.doctor_id 
INNER JOIN Billing b ON a.appointment_id = b.appointment_id 
WHERE b.payment_status = 'Paid' GROUP BY dep.department_id, dep.department_name;

SELECT SUM(amount) AS Total_Collected FROM Billing WHERE payment_status = 'Paid';

SELECT d.name, COUNT(a.appointment_id) AS Visit_Count FROM Doctors d 
JOIN Appointments a ON d.doctor_id = a.doctor_id 
WHERE a.status = 'Completed' GROUP BY d.doctor_id, d.name ORDER BY Visit_Count DESC LIMIT 1;

SELECT AVG(consultation_fee) AS Avg_Fee FROM Doctors;

SELECT d.name AS Doctor_Name, dep.department_name FROM Doctors d 
INNER JOIN Doctor_Department dd ON d.doctor_id = dd.doctor_id 
INNER JOIN Departments dep ON dd.department_id = dep.department_id;

SELECT DISTINCT p.name, a.status FROM Patients p 
LEFT JOIN Appointments a ON p.patient_id = a.patient_id WHERE a.status = 'Completed';

SELECT a.appointment_id, a.appointment_date, b.payment_status FROM Billing b 
RIGHT JOIN Appointments a ON b.appointment_id = a.appointment_id WHERE b.invoice_id IS NULL;

SELECT p.name AS Patient_Name, a.appointment_id FROM Patients p 
LEFT JOIN Appointments a ON p.patient_id = a.patient_id WHERE a.appointment_id IS NULL 
UNION 
SELECT p.name AS Patient_Name, a.appointment_id FROM Patients p 
RIGHT JOIN Appointments a ON p.patient_id = a.patient_id WHERE p.patient_id IS NULL;

SELECT name FROM Doctors 
WHERE doctor_id IN (
    SELECT doctor_id 
    FROM Appointments 
    GROUP BY doctor_id 
    HAVING COUNT(DISTINCT patient_id) > 50
);

SELECT name FROM Patients 
WHERE patient_id = (
    SELECT patient_id 
    FROM Billing 
    WHERE payment_status = 'Paid' 
    GROUP BY patient_id 
    ORDER BY SUM(amount) DESC 
    LIMIT 1
);

SELECT * FROM Appointments 
WHERE doctor_id IN (
    SELECT doctor_id 
    FROM Doctors 
    WHERE specialization = 'Dermatology'
);

SELECT MONTH(appointment_date) AS Appt_Month, COUNT(*) AS Total_Visits FROM Appointments GROUP BY MONTH(appointment_date);

ALTER TABLE Medical_Records 
ADD COLUMN admission_date DATE, 
ADD COLUMN discharge_date DATE;

UPDATE Medical_Records SET admission_date = '2024-02-28', discharge_date = '2024-03-02' WHERE record_id = 1;
UPDATE Medical_Records SET admission_date = '2023-03-20', discharge_date = '2023-03-30' WHERE record_id = 8;

SELECT patient_id, DATEDIFF(discharge_date, admission_date) AS Stay_Days FROM Medical_Records 
WHERE admission_date IS NOT NULL AND discharge_date IS NOT NULL;

SELECT DATE_FORMAT(treatment_date, '%d-%m-%Y') AS Formatted_Date 
FROM Medical_Records;

SELECT UPPER(name) AS Uppercase_Name FROM Patients;

SELECT TRIM(name) AS Clean_Name FROM Doctors;

SELECT name, COALESCE(phone_number, 'Not Available') AS Contact_Number FROM Patients;

SELECT d.name, COUNT(DISTINCT a.patient_id) AS Unique_Patients, 
RANK() OVER (ORDER BY COUNT(DISTINCT a.patient_id) DESC) AS Doctor_Rank FROM Doctors d 
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id GROUP BY d.doctor_id, d.name;

SELECT DATE_FORMAT(payment_date, '%Y-%m') AS Payment_Month, SUM(amount) AS Monthly_Revenue, 
SUM(SUM(amount)) OVER (ORDER BY DATE_FORMAT(payment_date, '%Y-%m')) AS Running_Total FROM Billing 
WHERE payment_status = 'Paid' GROUP BY DATE_FORMAT(payment_date, '%Y-%m');

SELECT appointment_date, COUNT(*) AS Daily_Appointments, SUM(COUNT(*)) 
OVER (ORDER BY appointment_date) AS Running_Total 
FROM Appointments GROUP BY appointment_date;

SELECT p.name, COUNT(m.record_id) AS Record_Count,
    CASE 
        WHEN COUNT(m.record_id) > 5 THEN 'High' 
        WHEN COUNT(m.record_id) BETWEEN 3 AND 5 THEN 'Medium' 
        ELSE 'Low' 
    END AS Risk_Level FROM Patients p
LEFT JOIN Medical_Records m ON p.patient_id = m.patient_id GROUP BY p.patient_id, p.name;

ALTER TABLE Doctors ADD COLUMN joining_date DATE;

UPDATE Doctors SET joining_date = '2004-05-10' WHERE doctor_id = 1;
UPDATE Doctors SET joining_date = '2016-08-15' WHERE doctor_id = 2;
UPDATE Doctors SET joining_date = '2021-01-20' WHERE doctor_id = 3;
UPDATE Doctors SET joining_date = '2012-11-01' WHERE doctor_id = 4;
UPDATE Doctors SET joining_date = '2018-03-10' WHERE doctor_id = 5;

SELECT name, joining_date, (YEAR(CURDATE()) - YEAR(joining_date)) AS Calculated_Years,
    CASE 
        WHEN (YEAR(CURDATE()) - YEAR(joining_date)) >= 15 THEN 'Senior' 
        WHEN (YEAR(CURDATE()) - YEAR(joining_date)) BETWEEN 5 AND 14 THEN 'Mid-Level' 
        ELSE 'Junior' 
    END AS Category FROM Doctors;