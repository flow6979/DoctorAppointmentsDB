-- Clinics
CREATE TABLE Clinics (
  clinic_id INT AUTO_INCREMENT PRIMARY KEY,
  clinic_name VARCHAR(100) NOT NULL,
  clinic_address VARCHAR(200) NOT NULL
);

-- Doctors
CREATE TABLE Doctors (
  doctor_id INT AUTO_INCREMENT PRIMARY KEY,
  doctor_name VARCHAR(100) NOT NULL,
  specialization VARCHAR(100) NOT NULL
);

-- Clinic_Doctors
CREATE TABLE Clinic_Doctors (
  clinic_doctor_id INT AUTO_INCREMENT PRIMARY KEY,
  clinic_id INT NOT NULL,
  doctor_id INT NOT NULL,
  FOREIGN KEY (clinic_id) REFERENCES Clinics(clinic_id),
  FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Patients
CREATE TABLE Patients (
  patient_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_name VARCHAR(100) NOT NULL,
  patient_dob DATE NOT NULL,
  patient_contact VARCHAR(20) NOT NULL
);

-- Appointments
CREATE TABLE Appointments (
  appointment_id INT AUTO_INCREMENT PRIMARY KEY,
  clinic_doctor_id INT NOT NULL,
  patient_id INT NOT NULL,
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL,
  appointment_status ENUM('Booked', 'Cancelled') NOT NULL,
  FOREIGN KEY (clinic_doctor_id) REFERENCES Clinic_Doctors(clinic_doctor_id),
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
