CREATE DATABASE FitnessCentrePP;
USE FitnessCentrePP;

CREATE TABLE Member (
    MemberID INT AUTO_INCREMENT,
    ContactNumber VARCHAR(15),
    EmergencyContactNumber VARCHAR(15),
    MembershipType VARCHAR(50),
    PointsEarned INT,
    VIPStatus BOOLEAN,
    RegistrationDate DATE,
    ReferralPoints INT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    DateOfBirth DATE,
    Address TEXT,
    PRIMARY KEY (MemberID)
);

CREATE TABLE Instructor (
    InstructorID INT AUTO_INCREMENT,
    Name VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Specialization VARCHAR(50),
    Certification VARCHAR(100),
    RevenueGenerate FLOAT,
    ClassID INT,
    PRIMARY KEY (InstructorID)
);

CREATE TABLE Equipment (
    EquipmentID INT AUTO_INCREMENT,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Brand VARCHAR(50),
    HourlyRate FLOAT,
    DailyRate FLOAT,
    Status VARCHAR(50),
    PRIMARY KEY (EquipmentID)
);

CREATE TABLE Merchandise (
    MerchandiseID INT AUTO_INCREMENT,
    Name VARCHAR(100),
    Price FLOAT,
    InventoryStock INT,
    PRIMARY KEY (MerchandiseID)
);

CREATE TABLE Class (
    ClassID INT AUTO_INCREMENT,
    ClassName VARCHAR(100),
    IntensityLevel VARCHAR(50),
    Timing TIME,
    InstructorID INT,
    MaxCapacity INT,
    EquipmentID INT,
    ClassDate DATE,
    PRIMARY KEY (ClassID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT,
    Date DATE,
    PointsEarned INT,
    MemberID INT,
    ClassID INT,
    PRIMARY KEY (AttendanceID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE PersonalTrainingSession (
    SessionID INT AUTO_INCREMENT,
    Date DATE,
    Duration TIME,
    Cost FLOAT,
    PointsEarned INT,
    InstructorID INT,
    MemberID INT,
    PRIMARY KEY (SessionID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

CREATE TABLE Package (
    PackageID INT AUTO_INCREMENT,
    Name VARCHAR(100),
    ClassCount INT,
    Price FLOAT,
    GuestPassesIncluded INT,
    PRIMARY KEY (PackageID)
);

CREATE TABLE Membership (
    MembershipID INT AUTO_INCREMENT,
    MembershipType VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    MemberID INT,
    PackageID INT,
    PRIMARY KEY (MembershipID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (PackageID) REFERENCES Package(PackageID)
);

CREATE TABLE Friend (
    MemberID INT,
    FriendID INT,
    PRIMARY KEY (MemberID, FriendID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (FriendID) REFERENCES Member(MemberID)
);

CREATE TABLE EquipmentRental (
    RentalID INT AUTO_INCREMENT,
    EquipmentID INT,
    MemberID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    Cost FLOAT,
    PointsEarned INT,
    PRIMARY KEY (RentalID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

CREATE TABLE SatisfactionScores (
    ClassID INT,
    MemberID INT,
    Score FLOAT,
    UserFeedback TEXT,
    SuggestedImprovement TEXT,
    BrandSatisfaction FLOAT,
    IntensitySatisfaction FLOAT,
    PRIMARY KEY (ClassID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

INSERT INTO Member (ContactNumber, EmergencyContactNumber, MembershipType, PointsEarned, VIPStatus, RegistrationDate, ReferralPoints, Name, Email, DateOfBirth, Address) VALUES
('0175334776', '0187654321', 'Family', 100, TRUE, '2022-01-01', 10, 'Praveen', 'praveen@gmail.com', '1990-01-01', '23, Bandar Botanic 91'),
('0145678901', '0187654321', 'Family', 80, FALSE, '2022-02-01', 8, 'Syahmi', 'syahmi@gmail.com', '1991-02-01', '45, Jalan Pandamaran Jaya 29'),
('0156789012', '0187654321', 'Family', 60, FALSE, '2022-03-01', 6, 'Preti', 'preti@gmail.com', '1992-03-01', '12, Bandar Botanic 77'),
('0167890123', '0187654321', 'Individual', 120, TRUE, '2022-04-01', 12, 'Khaif', 'khaif@gmail.com', '1993-04-01', '86, Jalan Pandamaran Jaya 28'),
('0178901234', '0187654321', 'Individual', 90, FALSE, '2022-05-01', 9, 'Ravi', 'ravi@gmail.com', '1994-05-01', '17, Bandar Botanic 35'),
('0189012345', '0187654321', 'Family', 70, FALSE, '2022-06-01', 7, 'Syafiq', 'syafiq@gmail.com', '1995-06-01', '88, Jalan Pandamaran Jaya 19'),
('0190123456', '0187654321', 'Individual', 130, TRUE, '2022-07-01', 13, 'Danush', 'danush@gmail.com', '1996-07-01', '21, Bandar Botanic 17'),
('0101234567', '0187654321', 'Family', 100, FALSE, '2022-08-01', 10, 'Andrew', 'andrew@gmail.com', '1997-08-01', '53, Jalan Pandamaran Jaya 11'),
('0112345678', '0187654321', 'Individual', 80, FALSE, '2022-09-01', 8, 'Elbert', 'elbert@gmail.com', '1998-09-01', '65, Bandar Botanic 18'),
('0123456789', '0187654321', 'Family', 140, TRUE, '2022-10-01', 14, 'Jackson', 'jackson@gmail.com', '1999-10-01', '72, Jalan Pandamaran Jaya 81'),
('0134509876', '0198765432', 'Family', 110, FALSE, '2022-11-01', 11, 'Mia', 'mia@gmail.com', '2000-11-01', '37, Bandar Botanic 19'),
('0145610987', '0198765432', 'Individual', 90, FALSE, '2022-12-01', 9, 'Harris', 'harris@gmail.com', '2001-12-01', '56, Jalan Pandamaran Jaya 22'),
('0156721098', '0198765432', 'Individual', 150, TRUE, '2023-01-01', 15, 'Junxiang', 'junxiang@gmail.com', '2002-01-01', '27, Bandar Botanic 21'),
('0167832109', '0198765432', 'Individual', 120, FALSE, '2023-02-01', 12, 'Henry', 'henry@gmail.com', '2003-02-01', '34, Jalan Pandamaran Jaya 48'),
('0178943210', '0198765432', 'Family', 100, FALSE, '2023-03-01', 10, 'Arthur', 'arthur@gmail.com', '2004-03-01', '11, Bandar Botanic 17'),
('0189054321', '0198765432', 'Family', 160, TRUE, '2023-04-01', 16, 'Raaghav', 'raaghav@gmail.com', '2005-04-01', '88, Jalan Pandamaran Jaya 33'),
('0190165432', '0198765432', 'Family', 130, FALSE, '2023-05-01', 13, 'Charlotte', 'charlotte@gmail.com', '2006-05-01', '23, Bandar Botanic 55'),
('0101276543', '0198765432', 'Individual', 110, FALSE, '2023-06-01', 11, 'Ethan', 'ethan@gmail.com', '2007-06-01', '91, Jalan Pandamaran Jaya 16'),
('0112387654', '0198765432', 'Individual', 170, TRUE, '2023-07-01', 17, 'Amelia', 'amelia@gmail.com', '2008-07-01', '17, Bandar Botanic 48'),
('0123498765', '0198765432', 'Individual', 140, FALSE, '2023-08-01', 14, 'Logan', 'logan@gmail.com', '2009-08-01', '77, Jalan Pandamaran Jaya 25'),
('0134509877', '0198765432', 'Family', 120, FALSE, '2023-09-01', 12, 'Ella', 'ella@gmail.com', '2010-09-01', '18, Bandar Botanic 22'),
('0145610988', '0198765432', 'Family', 180, TRUE, '2023-10-01', 18, 'Nelson', 'nelson@gmail.com', '2011-10-01', '66, Jalan Pandamaran Jaya 91'),
('0156721099', '0198765432', 'Individual', 150, FALSE, '2023-11-01', 15, 'Grace', 'grace@gmail.com', '2012-11-01', '37, Bandar Botanic 24'),
('0167832110', '0198765432', 'Family', 130, FALSE, '2023-12-01', 13, 'Jack', 'jack@gmail.com', '2013-12-01', '58, Jalan Pandamaran Jaya 38'),
('0178943221', '0198765432', 'Individual', 190, TRUE, '2024-01-01', 19, 'Chloe', 'chloe@gmail.com', '2014-01-01', '28, Bandar Botanic 29'),
('0189054332', '0198765432', 'Family', 160, FALSE, '2024-02-01', 16, 'Rishi', 'rishi@gmail.com', '2015-02-01', '88, Jalan Pandamaran Jaya 12'),
('0190165443', '0198765432', 'Family', 140, FALSE, '2024-03-01', 14, 'Victoria', 'victoria@gmail.com', '2016-03-01', '45, Bandar Botanic 31'),
('0101276554', '0198765432', 'Family', 200, TRUE, '2024-04-01', 20, 'Dylan', 'dylan@gmail.com', '2017-04-01', '59, Jalan Pandamaran Jaya 22'),
('0112387665', '0198765432', 'Individual', 170, FALSE, '2024-05-01', 17, 'Peter', 'peter@gmail.com', '2018-05-01', '41, Bandar Botanic 68'),
('0123498776', '0198765432', 'Family', 150, FALSE, '2024-06-01', 15, 'Carter', 'carter@gmail.com', '2019-06-01', '38, Jalan Pandamaran Jaya 19'),
('0134509887', '0198765432', 'Family', 210, TRUE, '2024-07-01', 21, 'Yi Pei', 'yipei@gmail.com', '2020-07-01', '21, Bandar Botanic 73');

INSERT INTO Instructor (Name, ContactNumber, Email, Specialization, Certification, RevenueGenerate, ClassID) VALUES
('Ramesh', '0111111111', 'ramesh@gmail.com', 'Yoga', 'RYT 200', 1000.00, 1),
('Joyce', '0122222222', 'joyce@gmail.com', 'Pilates', 'Certified Pilates Instructor', 2000.00, 2),
('James', '0133333333', 'james@gmail.com', 'Cardio', 'Certified Cardio Trainer', 1500.00, 3),
('Pam', '0144444444', 'pam@gmail.com', 'Strength Training', 'Certified Strength and Conditioning Specialist', 1800.00, 4),
('Randy', '0155555555', 'randy@gmail.com', 'Aerobics', 'Certified Group Fitness Instructor', 1700.00, 5),
('Farah', '0166666666', 'farah@gmail.com', 'CrossFit', 'CrossFit Level 1 Trainer', 1900.00, 6),
('Hana', '0197777777', 'hana@gmail.com', 'Zumba', 'Licensed Zumba Instructor', 1600.00, 7),
('Ahmad', '0188888888', 'ahmad@gmail.com', 'Spin', 'Certified Spin Instructor', 2100.00, 8),
('Aisyah', '0199999999', 'aisyah@gmail.com', 'Boxing', 'Certified Boxing Fitness Trainer', 2200.00, 9),
('Mira', '0110101010', 'mira@gmail.com', 'Dance', 'Certified Dance Fitness Instructor', 2300.00, 10),
('Nadia', '0111111111', 'nadia@gmail.com', 'Pilates', 'Certified Pilates Instructor', 2400.00, 11),
('Izzat', '0112121212', 'izzat@gmail.com', 'Yoga', 'RYT 200', 2500.00, 12),
('Kumar', '0113131313', 'kumar@gmail.com', 'Cardio', 'Certified Cardio Trainer', 2600.00, 13),
('Faiz', '0174141414', 'faiz@gmail.com', 'Strength Training', 'Certified Strength and Conditioning Specialist', 2700.00, 14),
('Nurul', '0115151515', 'nurul@gmail.com', 'Aerobics', 'Certified Group Fitness Instructor', 2800.00, 15),
('Hakim', '0116161616', 'hakim@gmail.com', 'CrossFit', 'CrossFit Level 1 Trainer', 2900.00, 16),
('Fahmi', '0117171717', 'fahmi@gmail.com', 'Zumba', 'Licensed Zumba Instructor', 3000.00, 17),
('Siti', '0148181818', 'siti@gmail.com', 'Spin', 'Certified Spin Instructor', 3100.00, 18),
('Amina', '0119191919', 'amina@gmail.com', 'Boxing', 'Certified Boxing Fitness Trainer', 3200.00, 19),
('Sofea', '0120202020', 'sofea@gmail.com', 'Dance', 'Certified Dance Fitness Instructor', 3300.00, 20),
('Yusof', '0121212121', 'yusof@gmail.com', 'Pilates', 'Certified Pilates Instructor', 3400.00, 21),
('Aina', '0152222222', 'aina@gmail.com', 'Yoga', 'RYT 200', 3500.00, 22),
('Maisarah', '0135232323', 'maisarah@gmail.com', 'Cardio', 'Certified Cardio Trainer', 3600.00, 23),
('Khalid', '0193242424', 'khalid@gmail.com', 'Strength Training', 'Certified Strength and Conditioning Specialist', 3700.00, 24),
('Firdaus', '0175252525', 'firdaus@gmail.com', 'Aerobics', 'Certified Group Fitness Instructor', 3800.00, 25),
('Rizwan', '0120262626', 'rizwan@gmail.com', 'CrossFit', 'CrossFit Level 1 Trainer', 3900.00, 26),
('Azura', '0180972727', 'azura@gmail.com', 'Zumba', 'Licensed Zumba Instructor', 4000.00, 27),
('Inder', '0154382828', 'inder@gmail.com', 'Spin', 'Certified Spin Instructor', 4100.00, 28),
('Lotte', '0147292929', 'lotte@gmail.com', 'Boxing', 'Certified Boxing Fitness Trainer', 4200.00, 29),
('Intan', '0182403030', 'intan@gmail.com', 'Dance', 'Certified Dance Fitness Instructor', 4300.00, 30),
('Harith', '0149313131', 'harith@gmail.com', 'Pilates', 'Certified Pilates Instructor', 4400.00, 31);

INSERT INTO Equipment (Name, Type, Brand, HourlyRate, DailyRate, Status) VALUES
('Treadmill', 'Cardio', 'NordicTrack', 10.00, 50.00, 'Available'),
('Dumbbell Set', 'Strength', 'Rogue Fitness', 5.00, 25.00, 'In Use'),
('Yoga Mat', 'Flexibility', 'Manduka', 2.00, 10.00, 'Available'),
('Rowing Machine', 'Cardio', 'Concept2', 12.00, 60.00, 'Available'),
('Elliptical', 'Cardio', 'Precor', 15.00, 70.00, 'Available'),
('Kettlebells', 'Strength', 'Onnit', 6.00, 30.00, 'In Use'),
('Resistance Bands', 'Flexibility', 'TheraBand', 3.00, 15.00, 'Available'),
('Stationary Bike', 'Cardio', 'Peloton', 8.00, 40.00, 'Available'),
('Weight Bench', 'Strength', 'Hammer Strength', 10.00, 50.00, 'Available'),
('Medicine Ball', 'Flexibility', 'Dynamax', 4.00, 20.00, 'Available'),
('Pull-Up Bar', 'Strength', 'Iron Gym', 7.00, 35.00, 'In Use'),
('Foam Roller', 'Flexibility', 'TriggerPoint', 5.00, 25.00, 'Available'),
('Battle Ropes', 'Strength', 'Onnit', 8.00, 40.00, 'In Use'),
('Stepper', 'Cardio', 'StairMaster', 9.00, 45.00, 'Available'),
('Jump Rope', 'Cardio', 'Crossrope', 1.00, 5.00, 'Available'),
('TRX System', 'Strength', 'TRX', 11.00, 55.00, 'In Use'),
('Spin Bike', 'Cardio', 'Schwinn', 10.00, 50.00, 'Available'),
('Plyo Box', 'Strength', 'Rogue Fitness', 6.00, 30.00, 'Available'),
('Sandbag', 'Strength', 'Brute Force', 7.00, 35.00, 'Available'),
('Power Rack', 'Strength', 'Titan Fitness', 12.00, 60.00, 'In Use'),
('Ab Wheel', 'Strength', 'Perfect Fitness', 4.00, 20.00, 'Available'),
('Punching Bag', 'Cardio', 'Everlast', 9.00, 45.00, 'Available'),
('Stretching Strap', 'Flexibility', 'Gaiam', 2.00, 10.00, 'Available'),
('Cable Machine', 'Strength', 'Life Fitness', 14.00, 70.00, 'In Use'),
('Vibration Plate', 'Cardio', 'Power Plate', 13.00, 65.00, 'Available'),
('Gymnastic Rings', 'Strength', 'Rogue Fitness', 8.00, 40.00, 'Available'),
('Agility Ladder', 'Cardio', 'SKLZ', 3.00, 15.00, 'Available'),
('Foam Block', 'Flexibility', 'Manduka', 2.00, 10.00, 'Available'),
('Smith Machine', 'Strength', 'Body-Solid', 16.00, 80.00, 'In Use'),
('Tire Flip', 'Strength', 'Rogue Fitness', 18.00, 90.00, 'In Use'),
('Sled', 'Strength', 'Rogue Fitness', 20.00, 100.00, 'Available');

INSERT INTO Merchandise (Name, Price, InventoryStock) VALUES
('T-shirt', 20.00, 100),
('Water Bottle', 10.00, 200),
('Yoga Pants', 30.00, 150),
('Gym Bag', 40.00, 120),
('Sweatshirt', 35.00, 80),
('Headband', 5.00, 180),
('Fitness Tracker', 50.00, 60),
('Protein Powder', 25.00, 90),
('Resistance Bands', 15.00, 110),
('Yoga Block', 10.00, 70),
('Foam Roller', 25.00, 130),
('Jump Rope', 8.00, 140),
('Kettlebell', 45.00, 50),
('Dumbbells', 60.00, 40),
('Medicine Ball', 35.00, 65),
('Pull-Up Bar', 55.00, 75),
('Exercise Mat', 20.00, 100),
('Speed Rope', 12.00, 150),
('Wrist Wraps', 15.00, 90),
('Weightlifting Belt', 35.00, 85),
('Agility Ladder', 20.00, 100),
('Balance Board', 30.00, 60),
('Boxing Gloves', 40.00, 70),
('Cycling Gloves', 25.00, 80),
('Cooling Towel', 10.00, 160),
('Exercise Ball', 20.00, 100),
('Foam Roller', 25.00, 130),
('Grip Strengthener', 15.00, 90),
('Massage Ball', 10.00, 170),
('Resistance Tube', 12.00, 140),
('Sweatband', 5.00, 250);

INSERT INTO Class (ClassName, IntensityLevel, Timing, InstructorID, MaxCapacity, EquipmentID, ClassDate) VALUES
('Yoga Basics', 'Low', '09:00:00', 1, 20, 1, '2023-12-01'),
('Advanced Pilates', 'Medium', '10:00:00', 2, 15, 2, '2023-12-02'),
('Cardio Blast', 'High', '11:00:00', 3, 25, 3, '2023-12-03'),
('Strength Training', 'High', '12:00:00', 4, 20, 4, '2023-12-04'),
('Morning Spin', 'Medium', '07:00:00', 5, 18, 5, '2023-12-05'),
('Evening Yoga', 'Low', '18:00:00', 1, 22, 1, '2023-12-06'),
('Pilates for Beginners', 'Low', '08:00:00', 2, 15, 2, '2023-12-07'),
('Intense Cardio', 'High', '17:00:00', 3, 25, 3, '2023-12-08'),
('Strength and Conditioning', 'High', '19:00:00', 4, 20, 4, '2023-12-09'),
('Afternoon Spin', 'Medium', '14:00:00', 5, 18, 5, '2023-12-10'),
('Early Bird Yoga', 'Low', '06:00:00', 1, 22, 1, '2023-12-11'),
('Core Pilates', 'Medium', '13:00:00', 2, 15, 2, '2023-12-12'),
('HIIT Cardio', 'High', '16:00:00', 3, 25, 3, '2023-12-13'),
('Full Body Strength', 'High', '15:00:00', 4, 20, 4, '2023-12-14'),
('Lunchtime Spin', 'Medium', '12:00:00', 5, 18, 5, '2023-12-15'),
('Yoga Flow', 'Low', '17:00:00', 1, 22, 1, '2023-12-16'),
('Dynamic Pilates', 'Medium', '10:00:00', 2, 15, 2, '2023-12-17'),
('Power Cardio', 'High', '11:00:00', 3, 25, 3, '2023-12-18'),
('Body Sculpt', 'High', '12:00:00', 4, 20, 4, '2023-12-19'),
('Cycle Class', 'Medium', '07:00:00', 5, 18, 5, '2023-12-20'),
('Yoga for Flexibility', 'Low', '08:00:00', 1, 22, 1, '2023-12-21'),
('Intermediate Pilates', 'Medium', '09:00:00', 2, 15, 2, '2023-12-22'),
('High Energy Cardio', 'High', '10:00:00', 3, 25, 3, '2023-12-23'),
('Strength Circuit', 'High', '11:00:00', 4, 20, 4, '2023-12-24'),
('Morning Ride', 'Medium', '12:00:00', 5, 18, 5, '2023-12-25'),
('Gentle Yoga', 'Low', '06:00:00', 1, 22, 1, '2023-12-26'),
('Core Pilates', 'Medium', '07:00:00', 2, 15, 2, '2023-12-27'),
('Cardio Kickboxing', 'High', '08:00:00', 3, 25, 3, '2023-12-28'),
('Strength and Power', 'High', '09:00:00', 4, 20, 4, '2023-12-29'),
('Afternoon Ride', 'Medium', '10:00:00', 5, 18, 5, '2023-12-10'),
('Evening Stretch', 'Low', '18:00:00', 1, 22, 1, '2023-12-31');

INSERT INTO PersonalTrainingSession (Date, Duration, Cost, InstructorID, MemberID, PointsEarned) VALUES
('2024-01-01', '01:00:00', 100.00, 1, 1, 10),
('2024-01-02', '01:00:00', 100.00, 2, 2, 20),
('2024-01-03', '01:00:00', 100.00, 3, 3, 30),
('2024-01-04', '01:00:00', 100.00, 4, 4, 40),
('2024-01-05', '01:00:00', 100.00, 5, 5, 50),
('2024-01-06', '01:00:00', 100.00, 1, 6, 60),
('2024-01-07', '01:00:00', 100.00, 2, 7, 70),
('2024-01-08', '01:00:00', 100.00, 3, 8, 80),
('2024-01-09', '01:00:00', 100.00, 4, 9, 90),
('2024-01-10', '01:00:00', 100.00, 5, 10, 100),
('2024-01-11', '01:00:00', 100.00, 1, 11, 110),
('2024-01-12', '01:00:00', 100.00, 2, 12, 120),
('2024-01-13', '01:00:00', 100.00, 3, 13, 130),
('2024-01-14', '01:00:00', 100.00, 4, 14, 140),
('2024-01-15', '01:00:00', 100.00, 5, 15, 150),
('2024-01-16', '01:00:00', 100.00, 1, 16, 160),
('2024-01-17', '01:00:00', 100.00, 2, 17, 170),
('2024-01-18', '01:00:00', 100.00, 3, 18, 180),
('2024-01-19', '01:00:00', 100.00, 4, 19, 190),
('2024-01-20', '01:00:00', 100.00, 5, 20, 200),
('2024-01-21', '01:00:00', 100.00, 1, 21, 210),
('2024-01-22', '01:00:00', 100.00, 2, 22, 220),
('2024-01-23', '01:00:00', 100.00, 3, 23, 230),
('2024-01-24', '01:00:00', 100.00, 4, 24, 240),
('2024-01-25', '01:00:00', 100.00, 5, 25, 250),
('2024-01-26', '01:00:00', 100.00, 1, 26, 260),
('2024-01-27', '01:00:00', 100.00, 2, 27, 270),
('2024-01-28', '01:00:00', 100.00, 3, 28, 280),
('2024-01-29', '01:00:00', 100.00, 4, 29, 290),
('2024-01-30', '01:00:00', 100.00, 5, 30, 300),
('2024-01-31', '01:00:00', 100.00, 1, 31, 310);

INSERT INTO Package (Name, ClassCount, Price, GuestPassesIncluded) VALUES
('Fit & Fab 10-class pass', 5, 50.00, 1),
('Fit & Fab 10-class pass', 10, 90.00, 2),
('Fit & Fab 10-class pass', 15, 120.00, 3),
('Silver Sneakers yoga bundle', 5, 50.00, 1),
('Silver Sneakers yoga bundle', 10, 90.00, 2),
('Silver Sneakers yoga bundle', 15, 120.00, 3),
('Fit & Fab 10-class pass', 5, 50.00, 1),
('Silver Sneakers yoga bundle', 10, 90.00, 2),
('Fit & Fab 10-class pass', 15, 120.00, 3),
('Fit & Fab 10-class pass', 5, 50.00, 1),
('Silver Sneakers yoga bundle', 10, 90.00, 2),
('Silver Sneakers yoga bundle', 15, 120.00, 3),
('Silver Sneakers yoga bundle', 5, 50.00, 1),
('Silver Sneakers yoga bundle', 10, 90.00, 2),
('Silver Sneakers yoga bundle', 15, 120.00, 3),
('Silver Sneakers yoga bundle', 5, 50.00, 1),
('Fit & Fab 10-class pass', 10, 90.00, 2),
('Fit & Fab 10-class pass', 15, 120.00, 3),
('Fit & Fab 10-class pass', 5, 50.00, 1),
('Fit & Fab 10-class pass', 10, 90.00, 2),
('Silver Sneakers yoga bundle', 15, 120.00, 3),
('Silver Sneakers yoga bundle', 5, 50.00, 1),
('Silver Sneakers yoga bundle', 10, 90.00, 2),
('Silver Sneakers yoga bundle', 15, 120.00, 3),
('Fit & Fab 10-class pass', 5, 50.00, 1),
('Fit & Fab 10-class pass', 10, 90.00, 2),
('Fit & Fab 10-class pass', 15, 120.00, 3),
('Silver Sneakers yoga bundle', 5, 50.00, 1),
('Fit & Fab 10-class pass', 10, 90.00, 2),
('Silver Sneakers yoga bundle', 15, 120.00, 3),
('Silver Sneakers yoga bundle', 5, 50.00, 1);

INSERT INTO Membership (MembershipType, StartDate, EndDate, MemberID, PackageID) VALUES
('Family', '2024-01-01', '2024-01-31', 1, 1),
('Family', '2024-02-01', '2024-04-30', 2, 2),
('Family', '2024-03-01', '2025-02-28', 3, 3),
('Individual', '2024-04-01', '2024-04-30', 4, 4),
('Individual', '2024-05-01', '2024-07-31', 5, 5),
('Family', '2024-06-01', '2025-05-31', 6, 6),
('Family', '2024-07-01', '2024-07-31', 7, 7),
('Individual', '2024-08-01', '2024-10-31', 8, 8),
('Individual', '2024-09-01', '2025-08-31', 9, 9),
('Individual', '2024-10-01', '2024-10-31', 10, 10),
('Family', '2024-11-01', '2025-01-31', 11, 11),
('Family', '2024-12-01', '2025-11-30', 12, 12),
('Family', '2025-01-01', '2025-01-31', 13, 13),
('Individual', '2025-02-01', '2025-04-30', 14, 14),
('Individual', '2025-03-01', '2026-02-28', 15, 15),
('Individual', '2025-04-01', '2025-04-30', 16, 16),
('Family', '2025-05-01', '2025-07-31', 17, 17),
('Family', '2025-06-01', '2026-05-31', 18, 18),
('Individual', '2025-07-01', '2025-07-31', 19, 19),
('Individual', '2025-08-01', '2025-10-31', 20, 20),
('Individual', '2025-09-01', '2026-08-31', 21, 21),
('Individual', '2025-10-01', '2025-10-31', 22, 22),
('Family', '2025-11-01', '2026-01-31', 23, 23),
('Family', '2025-12-01', '2026-11-30', 24, 24),
('Family', '2026-01-01', '2026-01-31', 25, 25),
('Family', '2026-02-01', '2026-04-30', 26, 26),
('Individual', '2026-03-01', '2027-02-28', 27, 27),
('Individual', '2026-04-01', '2026-04-30', 28, 28),
('Individual', '2026-05-01', '2026-07-31', 29, 29),
('Family', '2026-06-01', '2027-05-31', 30, 30),
('Family', '2026-07-01', '2026-07-31', 31, 31);

INSERT INTO Attendance (Date, PointsEarned, ClassID, MemberID) VALUES
('2023-09-01', 10, 1, 1),
('2023-09-02', 20, 2, 2),
('2023-09-03', 30, 3, 3),
('2023-09-04', 40, 4, 4),
('2023-09-05', 50, 5, 5),
('2023-09-06', 60, 6, 6),
('2023-09-07', 70, 7, 7),
('2023-10-08', 80, 8, 8),
('2024-11-09', 90, 9, 9),
('2024-01-01', 10, 1, 1),
('2024-01-02', 20, 2, 2),
('2024-01-03', 30, 3, 3),
('2024-01-04', 40, 4, 4),
('2024-01-05', 50, 5, 5),
('2024-01-06', 60, 6, 6),
('2024-01-07', 70, 7, 7),
('2024-01-08', 80, 8, 8),
('2024-01-09', 90, 9, 9),
('2024-01-10', 100, 10, 10),
('2024-01-11', 110, 11, 11),
('2024-01-12', 120, 12, 12),
('2024-01-13', 130, 13, 13),
('2024-01-14', 140, 14, 14),
('2024-01-15', 150, 15, 15),
('2024-01-16', 160, 16, 16),
('2024-01-17', 170, 17, 17),
('2024-01-18', 180, 18, 18),
('2024-01-19', 190, 19, 19),
('2024-01-20', 200, 20, 20),
('2024-01-21', 210, 21, 21),
('2024-01-22', 220, 22, 22),
('2024-01-23', 230, 23, 23),
('2024-01-24', 240, 24, 24),
('2024-01-25', 250, 25, 25),
('2024-01-26', 260, 26, 26),
('2024-01-27', 270, 27, 27),
('2024-01-28', 280, 28, 28),
('2024-01-29', 290, 29, 29),
('2024-01-30', 300, 30, 30),
('2024-01-31', 310, 31, 31);

INSERT INTO EquipmentRental (StartTime, EndTime, Cost, EquipmentID, MemberID, PointsEarned) VALUES
('2024-01-01 08:00:00', '2024-01-01 10:00:00', 15.00, 1, 1, 10),
('2024-01-02 08:00:00', '2024-01-02 10:00:00', 15.00, 2, 2, 10),
('2024-01-03 08:00:00', '2024-01-03 10:00:00', 15.00, 3, 3, 10),
('2024-01-04 08:00:00', '2024-01-04 10:00:00', 15.00, 4, 4, 10),
('2024-01-05 08:00:00', '2024-01-05 10:00:00', 15.00, 5, 5, 10),
('2024-01-06 08:00:00', '2024-01-06 10:00:00', 15.00, 6, 6, 10),
('2024-01-07 08:00:00', '2024-01-07 10:00:00', 15.00, 7, 7, 10),
('2024-01-08 08:00:00', '2024-01-08 10:00:00', 15.00, 8, 8, 10),
('2024-01-09 08:00:00', '2024-01-09 10:00:00', 15.00, 9, 9, 10),
('2024-01-10 08:00:00', '2024-01-10 10:00:00', 15.00, 10, 10, 10),
('2024-01-11 08:00:00', '2024-01-11 10:00:00', 15.00, 11, 11, 10),
('2024-01-12 08:00:00', '2024-01-12 10:00:00', 15.00, 12, 12, 10),
('2024-01-13 08:00:00', '2024-01-13 10:00:00', 15.00, 13, 13, 10),
('2024-01-14 08:00:00', '2024-01-14 10:00:00', 15.00, 14, 14, 10),
('2024-01-15 08:00:00', '2024-01-15 10:00:00', 15.00, 15, 15, 10),
('2024-01-16 08:00:00', '2024-01-16 10:00:00', 15.00, 16, 16, 10),
('2024-01-17 08:00:00', '2024-01-17 10:00:00', 15.00, 17, 17, 10),
('2024-01-18 08:00:00', '2024-01-18 10:00:00', 15.00, 18, 18, 10),
('2024-01-19 08:00:00', '2024-01-19 10:00:00', 15.00, 19, 19, 10),
('2024-01-20 08:00:00', '2024-01-20 10:00:00', 15.00, 20, 20, 10),
('2024-01-21 08:00:00', '2024-01-21 10:00:00', 15.00, 21, 21, 10),
('2024-01-22 08:00:00', '2024-01-22 10:00:00', 15.00, 22, 22, 10),
('2024-01-23 08:00:00', '2024-01-23 10:00:00', 15.00, 23, 23, 10),
('2024-01-24 08:00:00', '2024-01-24 10:00:00', 15.00, 24, 24, 10),
('2024-01-25 08:00:00', '2024-01-25 10:00:00', 15.00, 25, 25, 10),
('2024-01-26 08:00:00', '2024-01-26 10:00:00', 15.00, 26, 26, 10),
('2024-01-27 08:00:00', '2024-01-27 10:00:00', 15.00, 27, 27, 10),
('2024-01-28 08:00:00', '2024-01-28 10:00:00', 15.00, 28, 28, 10),
('2024-01-29 08:00:00', '2024-01-29 10:00:00', 15.00, 29, 29, 10),
('2024-01-30 08:00:00', '2024-01-30 10:00:00', 15.00, 30, 30, 10),
('2024-01-31 08:00:00', '2024-01-31 10:00:00', 15.00, 31, 31, 10);

INSERT INTO SatisfactionScores (Score, UserFeedback, ClassID, MemberID, SuggestedImprovement, BrandSatisfaction, IntensitySatisfaction) VALUES
(5, 'Great facilities and friendly staff!', 1, 1, 'Upgrade equipment', 4.6, 4.7),
(4, 'Enjoyed the yoga class, but could use more mats.', 2, 2, 'Add more yoga mats', 4.5, 4.6),
(3, 'The spin class was too crowded.', 3, 3, 'Increase spin class capacity', 4.8, 4.9),
(5, 'Fantastic personal trainer!', 4, 4, 'Expand personal training options', 4.7, 4.8),
(4, 'Clean gym with a variety of machines.', 5, 5, 'Introduce new cardio machines', 4.6, 4.7),
(2, 'Disappointed with cleanliness in the locker rooms.', 6, 6, 'Improve locker room cleanliness', 4.9, 5.0),
(5, 'Love the new group fitness schedule!', 7, 7, 'Continue offering diverse classes', 4.5, 4.6),
(3, 'Need more benches in the weightlifting area.', 8, 8, 'Increase weightlifting bench availability', 4.8, 4.9),
(4, 'Friendly staff but equipment needs maintenance.', 9, 9, 'Enhance equipment maintenance', 4.8, 4.7),
(5, 'Well-maintained gym with helpful trainers.', 10, 10, 'Introduce nutrition counseling', 4.6, 4.7),
(4, 'Enjoyed the pool but wish it was bigger.', 11, 11, 'Expand the swimming pool', 4.6, 4.7),
(5, 'Convenient location and ample parking.', 12, 12, 'Improve WiFi connectivity', 4.9, 5.0),
(3, 'Limited space in the stretching area.', 13, 13, 'Expand stretching area', 4.5, 4.6),
(4, 'Great atmosphere and cleanliness.', 14, 14, 'Organize community fitness events', 4.8, 4.9),
(5, 'Excellent customer service and facilities.', 15, 15, 'Offer more personal training options', 4.7, 4.8),
(4, 'Love the new cycling studio!', 16, 16, 'Upgrade cycling equipment', 4.6, 4.7),
(3, 'Not enough treadmills available during peak hours.', 17, 17, 'Increase treadmill availability', 4.9, 5.0),
(5, 'Fantastic gym layout and variety of equipment.', 18, 18, 'Add more strength training machines', 4.5, 4.6),
(4, 'Knowledgeable trainers but busy during peak times.', 19, 19, 'Expand peak hour classes', 4.5, 4.6),
(2, 'Equipment frequently out of order.', 20, 20, 'Improve equipment maintenance', 4.8, 4.9),
(5, 'Great value for membership fees.', 21, 21, 'Offer more fitness workshops', 4.7, 4.8),
(4, 'Friendly staff and clean facilities.', 22, 22, 'Enhance group class offerings', 4.6, 4.7),
(3, 'Crowded during evening classes.', 23, 23, 'Expand class schedule', 4.9, 5.0),
(5, 'Amazing pool and sauna!', 24, 24, 'Add more relaxation areas', 4.5, 4.6),
(4, 'Enjoyed the fitness assessment.', 25, 25, 'Introduce nutrition counseling', 4.5, 4.6),
(5, 'Clean and spacious locker rooms.', 26, 26, 'Improve shower facilities', 4.8, 4.9),
(4, 'Professional trainers and diverse classes.', 27, 27, 'Expand outdoor workout area', 4.7, 4.8),
(3, 'Equipment needs updating.', 28, 28, 'Upgrade cardio machines', 4.6, 4.7),
(5, 'Friendly staff and convenient location.', 29, 29, 'Introduce more health assessments', 4.9, 5.0),
(4, 'Love the new yoga classes!', 30, 30, 'Enhance yoga class offerings', 4.5, 4.6),
(3, 'Limited parking space.', 31, 31, 'Improve parking facilities', 4.7, 4.9);

INSERT INTO Friend (MemberID, FriendID) VALUES
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 8),
(4, 9),
(5, 10),
(5, 11),
(6, 12),
(6, 13),
(7, 14),
(7, 15),
(8, 16),
(8, 17),
(9, 18),
(9, 19),
(10, 20),
(10, 21),
(11, 22),
(11, 23),
(12, 24),
(12, 25),
(13, 26),
(13, 27),
(14, 28),
(14, 29),
(15, 30),
(15, 31),
(16, 1);

ALTER TABLE PersonalTrainingSession ADD CONSTRAINT FK_Session_Instructor FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID);
ALTER TABLE PersonalTrainingSession ADD CONSTRAINT FK_Session_Member FOREIGN KEY (MemberID) REFERENCES Member(MemberID);

ALTER TABLE Package ADD CONSTRAINT FK_Package_Membership FOREIGN KEY (PackageID) REFERENCES Membership(PackageID);
ALTER TABLE Membership ADD CONSTRAINT FK_Membership_Member FOREIGN KEY (MemberID) REFERENCES Member(MemberID);
ALTER TABLE Membership ADD CONSTRAINT FK_Membership_Package FOREIGN KEY (PackageID) REFERENCES Package(PackageID);

ALTER TABLE Attendance ADD CONSTRAINT FK_Attendance_Member FOREIGN KEY (MemberID) REFERENCES Member(MemberID);
ALTER TABLE Attendance ADD CONSTRAINT FK_Attendance_Class FOREIGN KEY (ClassID) REFERENCES Class(ClassID);

ALTER TABLE Class ADD CONSTRAINT FK_Class_Instructor FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID);
ALTER TABLE Class ADD CONSTRAINT FK_Class_Equipment FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID);

ALTER TABLE EquipmentRental ADD CONSTRAINT FK_Rental_Equipment FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID);
ALTER TABLE EquipmentRental ADD CONSTRAINT FK_Rental_Member FOREIGN KEY (MemberID) REFERENCES Member(MemberID);

ALTER TABLE Friend ADD CONSTRAINT FK_Friend_Member FOREIGN KEY (MemberID) REFERENCES Member(MemberID);
ALTER TABLE Friend ADD CONSTRAINT FK_Friend_Friend FOREIGN KEY (FriendID) REFERENCES Member(MemberID);

ALTER TABLE Instructor ADD CONSTRAINT FK_Class_ID FOREIGN KEY (ClassID) REFERENCES Class(ClassID);

-- QUESTION 5
-- Provide a list of members with the most class attendance in the past month and the most popular class by average attendance in the past quarter.  
SELECT m.MemberID, m.Name, COUNT(*) AS AttendanceCount
FROM Attendance a
JOIN Member m ON a.MemberID = m.MemberID
WHERE Date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY MemberID
ORDER BY AttendanceCount DESC;

SELECT ClassID, AVG(AttendanceCount) AS AverageAttendance
FROM (
    SELECT ClassID, COUNT(*) AS AttendanceCount
    FROM Attendance
    WHERE Date >= DATE_SUB(CURDATE(), INTERVAL 1 QUARTER)
    GROUP BY ClassID, Date
) AS ClassAttendance
GROUP BY ClassID
ORDER BY AverageAttendance DESC
LIMIT 1;

-- QUESTION 6
-- Write an SQL query to list down all equipment currently unavailable for rent. 
SELECT EquipmentID, Name
FROM Equipment
WHERE Status != 'Available';

-- QUESTION 7
-- Compute a 10% discount on rental fees for all equipment. Calculate the potential revenue increase for equipment rentals in 2024 with the discounted price. 
-- 10% discount on rental fees for all equipment
SELECT EquipmentID, Name, HourlyRate, DailyRate, HourlyRate * 0.90 AS DiscountedHourlyRate, DailyRate * 0.90 AS DiscountedDailyRate
FROM Equipment;

-- potential revenue increase
SELECT SUM(Cost) AS OriginalRevenue, 
       SUM(Cost * 0.90) AS DiscountedRevenue,
       SUM(Cost * 0.90) - SUM(Cost) AS RevenueIncrease
FROM EquipmentRental
WHERE YEAR(StartTime) = 2024;

-- QUESTION 8
-- Generate a report showing the total number of classes offered by each instructor.
SELECT InstructorID, COUNT(*) AS TotalClasses
FROM Class
GROUP BY InstructorID;

-- QUESTION 9
-- Identify the instructor with the highest number of classes taught in 2023.
SELECT 
    I.InstructorID, 
    I.Name, 
    COUNT(C.ClassID) AS ClassesTaught 
FROM 
    Class C 
JOIN 
    Instructor I ON C.InstructorID = I.InstructorID 
WHERE 
    YEAR(C.ClassDate) = 2023 
GROUP BY 
    I.InstructorID, I.Name 
ORDER BY 
    ClassesTaught DESC 
LIMIT 1;

-- QUESTION 10
-- Provide a point accrual trend for different member types and activities (class attendance, rentals, PT sessions) across brands. Identify members with the highest point balances and their preferred point earning methods.
SELECT MembershipType, ActivityType, SUM(PointsEarned) AS TotalPoints
FROM (
    SELECT m.MembershipType, 'Class Attendance' AS ActivityType, a.PointsEarned
    FROM Member m
    JOIN Attendance a ON m.MemberID = a.MemberID
    UNION ALL
    SELECT m.MembershipType, 'Equipment Rental' AS ActivityType, er.PointsEarned
    FROM Member m
    JOIN EquipmentRental er ON m.MemberID = er.MemberID
    UNION ALL
    SELECT m.MembershipType, 'PT Session' AS ActivityType, pts.PointsEarned
    FROM Member m
    JOIN PersonalTrainingSession pts ON m.MemberID = pts.MemberID
) AS PointsData
GROUP BY MembershipType, ActivityType;

-- QUESTION 11
-- Identify the top three selling packages (considering both Fit & Fab and Silver Sneakers) and analyse any correlations with brand affiliation or guest pass usage. 
-- top three selling packages
SELECT p.PackageID, p.Name, COUNT(m.MembershipID) AS TotalSales
FROM Membership m
JOIN Package p ON m.PackageID = p.PackageID
GROUP BY p.PackageID, p.Name
ORDER BY TotalSales DESC
LIMIT 3;

-- correlations with brand affiliation or guest pass usage
SELECT p.PackageID, p.Name, SUM(p.GuestPassesIncluded) AS TotalGuestPassesUsed
FROM Membership m
JOIN Package p ON m.PackageID = p.PackageID
GROUP BY p.PackageID, p.Name
ORDER BY TotalGuestPassesUsed DESC;

-- QUESTION 12
-- Determine the most successful "Bring a Friend" campaigns by analysing which members have introduced the newest members (across all membership types) and the points earned.
SELECT Member.MemberID, COUNT(FriendID) AS FriendsReferred, SUM(ReferralPoints) AS PointsEarned
FROM Friend
JOIN Member ON Friend.MemberID = Member.MemberID
GROUP BY MemberID
ORDER BY FriendsReferred DESC, PointsEarned DESC;

-- QUESTION 13
-- Analyse the "class satisfaction scores" data to identify trends in member preferences and suggest improvements to class offerings based on brand, intensity level, and user feedback.
-- trend:
SELECT ClassID, AVG(Score) AS AverageScore, AVG(BrandSatisfaction) AS BrandSatisfaction, AVG(IntensitySatisfaction) AS IntensitySatisfaction
FROM SatisfactionScores
GROUP BY ClassID;

-- suggestions
SELECT s.SuggestedImprovement, COUNT(*) AS Frequency
FROM SatisfactionScores s
GROUP BY s.SuggestedImprovement
ORDER BY Frequency DESC;

-- QUESTION 14
-- Unravel the member engagement mystery! List members with the most points earned in the past quarter, categorized by points earned through workouts, challenges, and healthy eating habits.  
-- assuming that activities are challenges and personal training sessions includes a healthy diet
SELECT MemberID, ActivityType, SUM(PointsEarned) AS TotalPoints
FROM (
    SELECT MemberID, 'Workouts' AS ActivityType, PointsEarned
    FROM Attendance
    WHERE Date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    UNION ALL
    SELECT MemberID, 'Challenges' AS ActivityType, PointsEarned
    FROM EquipmentRental
    WHERE StartTime >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    UNION ALL
    SELECT MemberID, 'Healthy Eating' AS ActivityType, PointsEarned
    FROM PersonalTrainingSession
    WHERE Date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
) AS QuarterlyPoints
GROUP BY MemberID, ActivityType;
