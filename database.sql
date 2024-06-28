-- Clinics
CREATE TABLE Clinic (
  clinicId INT PRIMARY KEY,
  clinicName VARCHAR(100),
  clinicAddress VARCHAR(200),
  clinicPhone VARCHAR(20)
);

-- Doctors
CREATE TABLE Doctor (
  doctorId INT PRIMARY KEY,
  doctorName VARCHAR(100),
  doctorSpecialty VARCHAR(50),
  clinicId INT,
  FOREIGN KEY (clinicId) REFERENCES Clinic(clinicId)
);

-- Patients
CREATE TABLE Patient (
  patientId INT PRIMARY KEY,
  patientName VARCHAR(100),
  patientEmail VARCHAR(100),
  patientPhone VARCHAR(20),
  patientDOB DATE
);

-- Appointments
CREATE TABLE Appointment (
  appointmentId INT PRIMARY KEY,
  appointmentDateTime DATETIME,
  patientId INT,
  doctorId INT,
  clinicId INT,
  appointmentStatus VARCHAR(20),
  FOREIGN KEY (patientId) REFERENCES Patient(patientId),
  FOREIGN KEY (doctorId) REFERENCES Doctor(doctorId),
  FOREIGN KEY (clinicId) REFERENCES Clinic(clinicId)
);





-- Insert data into Clinic table
INSERT INTO Clinic (clinicId, clinicName, clinicAddress, clinicPhone)
VALUES
  (1, 'Arogya Clinic', '123 Main Street, New Delhi', '011-1234567'),
  (2, 'Swasthya Hospital', '456 Park Avenue, Mumbai', '022-7654321'),
  (3, 'Chikitsa Multispecialty', '789 Oak Road, Bangalore', '080-4567890'),
  (4, 'Arogyam Polyclinic', '321 Elm Street, Chennai', '044-7890123'),
  (5, 'Swastha Multispecialty', '654 Pine Avenue, Kolkata', '033-4561789');

-- Insert data into Doctor table
INSERT INTO Doctor (doctorId, doctorName, doctorSpecialty, clinicId)
VALUES
  (1, 'Dr. Aadhya Sharma', 'Pediatrics', 1),
  (2, 'Dr. Vihaan Gupta', 'Cardiology', 2),
  (3, 'Dr. Nisha Patel', 'Dermatology', 3),
  (4, 'Dr. Arjun Reddy', 'Orthopedics', 4),
  (5, 'Dr. Priya Chopra', 'Gynecology', 5),
  (6, 'Dr. Rohan Malhotra', 'Psychiatry', 1),
  (7, 'Dr. Neha Verma', 'Neurology', 2),
  (8, 'Dr. Jai Singh', 'Gastroenterology', 3),
  (9, 'Dr. Riya Kapoor', 'Ophthalmology', 4),
  (10, 'Dr. Aditya Mehta', 'Urology', 5);

-- Insert data into Patient table
INSERT INTO Patient (patientId, patientName, patientEmail, patientPhone, patientDOB)
VALUES
  (1, 'Aryan Sharma', 'aryan@example.com', '9876543210', '1990-05-15'),
  (2, 'Priya Gupta', 'priya@example.com', '8765432109', '1985-11-20'),
  (3, 'Isha Patel', 'isha@example.com', '7654321098', '1992-03-08'),
  (4, 'Rohan Reddy', 'rohan@example.com', '6543210987', '1988-09-25'),
  (5, 'Neha Chopra', 'neha@example.com', '5432109876', '1995-06-12'),
  (6, 'Aadhya Malhotra', 'aadhya@example.com', '4321098765', '1982-12-30'),
  (7, 'Vihaan Verma', 'vihaan@example.com', '3210987654', '1991-04-18'),
  (8, 'Nisha Singh', 'nisha@example.com', '2109876543', '1987-07-05'),
  (9, 'Arjun Kapoor', 'arjun@example.com', '1098765432', '1993-10-22'),
  (10, 'Priya Mehta', 'priya2@example.com', '0987654321', '1989-02-28');

-- Insert data into Appointment table
INSERT INTO Appointment (appointmentId, appointmentDateTime, patientId, doctorId, clinicId, appointmentStatus)
VALUES
  (1, '2023-06-01 10:00:00', 1, 1, 1, 'Booked'),
  (2, '2023-06-02 14:30:00', 2, 2, 2, 'Booked'),
  (3, '2023-06-03 09:45:00', 3, 3, 3, 'Booked'),
  (4, '2023-06-04 16:20:00', 4, 4, 4, 'Booked'),
  (5, '2023-06-05 11:10:00', 5, 5, 5, 'Booked'),
  (6, '2023-06-06 15:00:00', 6, 6, 1, 'Booked'),
  (7, '2023-06-07 13:40:00', 7, 7, 2, 'Booked'),
  (8, '2023-06-08 10:30:00', 8, 8, 3, 'Booked'),
  (9, '2023-06-09 14:00:00', 9, 9, 4, 'Booked'),
  (10, '2023-06-10 12:15:00', 10, 10, 5, 'Booked');

