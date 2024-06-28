-- All appointments booked in the last 7 days for a doctor

SELECT *
FROM Appointment
WHERE doctorId = 1
  AND appointmentDateTime >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
ORDER BY appointmentDateTime DESC;


-- All appointments booked in the last 2 days and scheduled within the next 5 hours for a doctor

SELECT *
FROM Appointment
WHERE doctorId = 1
  AND appointmentDateTime >= DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 2 DAY)
  AND appointmentDateTime <= DATE_ADD(CURRENT_TIMESTAMP(), INTERVAL 5 HOUR)
ORDER BY appointmentDateTime ASC;


-- Users who have at least 1 appointment and have their birthday coming in the next 5 days

SELECT p.patientId, p.patientName, p.patientDOB
FROM Patient p
INNER JOIN Appointment a ON p.patientId = a.patientId
WHERE DATE_FORMAT(p.patientDOB, '%m-%d') BETWEEN DATE_FORMAT(CURRENT_DATE(), '%m-%d') AND DATE_FORMAT(DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY), '%m-%d')
GROUP BY p.patientId
HAVING COUNT(a.appointmentId) >= 1;


-- Appointments for a particular patient in the last 7 days
SELECT *
FROM Appointment
WHERE patientId = 1
  AND appointmentDateTime >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
ORDER BY appointmentDateTime DESC;

-- Appointment cancellation percentage for a doctor by clinic
SELECT
  c.clinicName,
  d.doctorName,
  ROUND(100.0 * SUM(CASE WHEN a.appointmentStatus = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellationPercentage
FROM Appointment a
JOIN Doctor d ON a.doctorId = d.doctorId
JOIN Clinic c ON a.clinicId = c.clinicId
WHERE d.doctorId = 1
GROUP BY c.clinicName, d.doctorName;
