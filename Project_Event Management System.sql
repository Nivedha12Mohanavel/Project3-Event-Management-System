--PROJECT 3: Event Management System

-- Task 1: Database Creation

CREATE DATABASE EventsManagement;
USE EventsManagement;

-- Create Events Table
CREATE TABLE Events (
    Event_Id INT PRIMARY KEY,
    Event_Name NVARCHAR(100) NOT NULL,
    Event_Date DATE NOT NULL,
    Event_Location NVARCHAR(150) NOT NULL,
    Event_Description NVARCHAR(MAX)
);

-- Create Attendees Table
CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY,
    Attendee_Name NVARCHAR(100) NOT NULL,
    Attendee_Phone NVARCHAR(15),
    Attendee_Email NVARCHAR(100),
    Attendee_City NVARCHAR(100)
);

-- Create Registrations Table
CREATE TABLE Registrations (
    Registration_Id INT PRIMARY KEY,
    Event_Id INT NOT NULL,
    Attendee_Id INT NOT NULL,
    Registration_Date DATE NOT NULL,
    Registration_Amount DECIMAL(10,2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

--  Task 2: Data Creation

INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description)
VALUES 
(1, 'Tech Conference', '2024-12-01', 'Seattle', 'A conference on emerging tech trends'),
(2, 'Music Fest', '2024-12-10', 'Los Angeles', 'An annual music festival'),
(3, 'Business Summit', '2024-11-25', 'New York', 'A summit for business professionals'),
(4, 'Art Expo', '2024-12-05', 'Chicago', 'An exhibition showcasing modern art');

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES 
(101, 'John', '1234567890', 'john@gmail.com', 'Seattle'),
(102, 'Jane', '9876543210', 'jane@gmail.com', 'Los Angeles'),
(103, 'Emily', '1122334455', 'emily@gmail.com', 'New York'),
(104, 'Michael', '9988776655', 'michael@gmail.com', 'Chicago');

INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES 
(1, 1, 101, '2024-11-20', 150.00),
(2, 2, 102, '2024-11-22', 200.00),
(3, 3, 103, '2024-11-15', 100.00),
(4, 4, 104, '2024-11-25', 50.00);

SELECT * FROM Events;
SELECT * FROM Attendees;
SELECT * FROM Registrations;

-- Task 3: Manage Event Details

-- To insert a New Event

INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description)
VALUES (5, 'Food Carnival', '2024-12-20', 'Miami', 'A carnival celebrating diverse cuisines');

-- To update an Events Information

UPDATE Events
SET Event_Location = 'San Francisco', Event_Date = '2024-12-15'
WHERE Event_Id = 3;

-- To delete an Event

DELETE FROM Registrations
WHERE Event_Id = 4; 
DELETE FROM Events
WHERE Event_Id = 4;

-- Task 4: Manage Track Attendees & Handle Events

-- To insert a New Attendee

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
VALUES (105, 'Chris', '3344556677', 'chris@gmail.com', 'Austin'),
VALUES (5, 'Chris', '3344556677', 'chris@gmail.com', 'Austin');

-- To register an Attendee for an Event

INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (6, 5, 105, '2024-11-23', 120.00);

-- To retrieve event information, generate attendee lists, and calculate event attendance statistics

SELECT * FROM Events;

-- To generate Attendee List for a Specific Event

SELECT a.Attendee_Name, a.Attendee_Email, a.Attendee_City FROM Registrations r
JOIN Attendees a ON r.Attendee_Id = a.Attendee_Id
WHERE r.Event_Id = 2;

-- To Calculate Event Attendance Statistics

SELECT e.Event_Name, COUNT(r.Registration_Id) AS Total_Attendees FROM Events e
LEFT JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Name;