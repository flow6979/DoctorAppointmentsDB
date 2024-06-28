# DoctorAppointmentsDB

## Appointment syste -

There can be many users using our appointment  system. We have lot of clinics onboarded along with their doctors. A doctor can go to multiple clinics. A user can book an appointment to a doctor going to a particular clinic by choosing a time.

Design a single database, add relevant optimisations and write optimised queries for the cases stated.


1. All appointments booked in last 7 days for a doctor
2. All appointments booked in last 2 days n scheduled within next 5 hours for a doctor
3. User who have atleast 1 appointment and have their birthday coming in next 5 days
4. Appointments for a particular patient in the last 7 days 
5. Appointment cancellation percentage for a doctor by clinic


## ER Diagram -

![ER Diagram](https://github.com/flow6979/DoctorAppointmentsDB/blob/main/ER%20Diagram.png)

## Queries explanation - 

### All appointments booked in the last 7 days for a doctor


`SELECT *
FROM Appointment
WHERE doctorId = 1
  AND appointmentDateTime >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
ORDER BY appointmentDateTime DESC;`

- This query retrieves all appointments for a specific doctor (doctorId = 1) that were booked within the last 7 days. It uses the WHERE clause to filter the appointments based on the doctor ID and appointment date range, and the ORDER BY clause to sort the results in descending order by appointment date and time.


### All appointments booked in the last 2 days and scheduled within the next 5 hours for a doctor


`SELECT *
FROM Appointment
WHERE doctorId = 1
  AND appointmentDateTime >= DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 2 DAY)
  AND appointmentDateTime <= DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 5 HOUR)
ORDER BY appointmentDateTime ASC;`

- It retrieves all appointments for a specific doctor (doctorId = 1) that were booked within the last 2 days and are scheduled within the next 5 hours. It uses the WHERE clause to filter the appointments based on the doctor ID and appointment date range, and the ORDER BY clause to sort the results in ascending order by appointment date and time.

### Users who have at least 1 appointment and have their birthday coming in the next 5 days


`SELECT p.patientId, p.patientName, p.patientDOB
FROM Patient p
INNER JOIN Appointment a ON p.patientId = a.patientId
WHERE DATE_FORMAT(p.patientDOB, '%m-%d') BETWEEN DATE_FORMAT(CURRENT_DATE(), '%m-%d') AND DATE_FORMAT(DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY), '%m-%d')
GROUP BY p.patientId
HAVING COUNT(a.appointmentId) >= 1;`

- This query retrieves patient IDs, names, and birth dates for patients who have at least one appointment and whose birthday falls within the next 5 days. It uses an INNER JOIN to connect the Patient and Appointment tables, the WHERE clause to filter patients based on their birthday range, the GROUP BY clause to group the results by patient ID, and the HAVING clause to filter for patients with at least one appointment.

### Appointments for a particular patient in the last 7 days


`SELECT *
FROM Appointment
WHERE patientId = 1
  AND appointmentDateTime >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
ORDER BY appointmentDateTime DESC;`

- It retrieves all appointments for a specific patient (patientId = 1) that were booked within the last 7 days. It uses the WHERE clause to filter the appointments based on the patient ID and appointment date range, and the ORDER BY clause to sort the results in descending order by appointment date and time.

### Appointment cancellation percentage for a doctor by clinic


`SELECT
  c.clinicName,
  d.doctorName,
  ROUND(100.0 * SUM(CASE WHEN a.appointmentStatus = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellationPercentage
FROM Appointment a
JOIN Doctor d ON a.doctorId = d.doctorId
JOIN Clinic c ON a.clinicId = c.clinicId
WHERE d.doctorId = 1
GROUP BY c.clinicName, d.doctorName;`

- This query calculates the appointment cancellation percentage for a specific doctor (doctorId = 1) by clinic. It uses JOIN clauses to connect the Appointment, Doctor, and Clinic tables, the WHERE clause to filter for the specific doctor, the CASE statement to count the number of cancelled appointments, and the GROUP BY clause to group the results by clinic name and doctor name. The ROUND function is used to format the cancellation percentage to two decimal places.
  
