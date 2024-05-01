CREATE DATABASE SEProject;

USE SEProject;

-- Users Table
CREATE TABLE Users (
    U_ID INT PRIMARY KEY,
    U_NAME VARCHAR(255) NOT NULL,
    U_ROLE VARCHAR(255) NOT NULL CHECK (U_ROLE IN('Student', 'FYP', 'Finance', 'Admin', 'Director')),
    U_EMAIL VARCHAR(255) UNIQUE,
    U_PASSWORD VARCHAR(255) -- Hash passwords in production
);


-- DegreeIssuanceForm Table
CREATE TABLE DegreeIssuanceForm (
    F_ID INT PRIMARY KEY,
    U_ID INT NOT NULL,
	D_NAME VARCHAR(255),
	D_EMAIL VARCHAR(255),
	D_ADDRESS VARCHAR(255),
	D_CNIC VARCHAR(50),
	D_ROLL VARCHAR(50),
	D_PHONE VARCHAR(20), -- Adjusted to VARCHAR to accommodate international phone formats
	D_DEGREE VARCHAR(50),
	D_FACULTY VARCHAR(50),
	D_YOP VARCHAR(50),
	D_CGPA VARCHAR(50),
    D_SUBMISSION DATE NOT NULL,
    D_STATUS VARCHAR(255) NOT NULL CHECK (D_STATUS IN('Pending', 'Processing', 'Completed')),
    FOREIGN KEY (U_ID) REFERENCES Users(U_ID)
);

-- ComplaintForm Table
CREATE TABLE ComplaintForm (
    C_ID INT PRIMARY KEY,
    U_ID INT NOT NULL,
	C_NAME VARCHAR(255),
	C_EMAIL VARCHAR(255),
	C_ROLLNO VARCHAR(255),
	C_DEPT VARCHAR(255),
	C_DESCRIPTION VARCHAR(MAX),
    C_STATUS VARCHAR(255) NOT NULL CHECK (C_STATUS IN('Pending', 'Processing', 'Completed')),
    C_SUBMISSION DATE NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES Users(U_ID)
);



-- Token Table for DegreeIssuance
CREATE TABLE DegreeToken (
    T_ID INT PRIMARY KEY,
    F_ID INT NOT NULL,
    FYP_DECISION VARCHAR(255) NOT NULL CHECK (FYP_DECISION IN('Pending', 'Accepted', 'Rejected')),
    FINANCE_DECISION VARCHAR(255) NOT NULL CHECK (FINANCE_DECISION IN('Pending', 'Accepted', 'Rejected')),
	T_STATUS VARCHAR(255) NOT NULL CHECK (T_STATUS IN('Request is Pending', 'One Stop Admin has started processing the request', 'Request is delivered to FYP committee', 'Request is delivered to Finance', 'Completed')),  
    FYP_COMMENT VARCHAR(255),
    FINANCE_COMMENT VARCHAR(255),
    FOREIGN KEY (F_ID) REFERENCES DegreeIssuanceForm(F_ID)
);

select * from DegreeToken

-- Token Table for Complaints
CREATE TABLE ComplaintToken (
    T_ID INT PRIMARY KEY,
    C_ID INT NOT NULL,
    C_STATUS VARCHAR(255) NOT NULL CHECK (C_STATUS IN('Pending', 'Accepted', 'Rejected')),
    EST_TIME INT, -- Estimated time in minutes
    GENERATION_DATE DATE,
    FOREIGN KEY (C_ID) REFERENCES ComplaintForm(C_ID)
);

SELECT C_STATUS FROM ComplaintToken

-- Payment Table
CREATE TABLE Payments (
    P_ID INT PRIMARY KEY,
    T_ID INT NOT NULL,
    P_STATUS VARCHAR(255) NOT NULL CHECK (P_STATUS IN('Paid', 'Unpaid')),
    P_TYPE VARCHAR(255) NOT NULL CHECK (P_TYPE IN('Processing Fee', 'Degree Fee')),
    TOTAL_AMOUNT DECIMAL(10,2),
    PAID_AMOUNT DECIMAL(10,2),
    FOREIGN KEY (T_ID) REFERENCES DegreeToken(T_ID)
);

-- Feedback Table
CREATE TABLE Feedback (
    FEED_ID INT PRIMARY KEY,
    D_TOKEN INT,
    C_TOKEN INT,
    COMMENT VARCHAR(255),
    U_ID INT,
    FOREIGN KEY (D_TOKEN) REFERENCES DegreeToken(T_ID),
    FOREIGN KEY (C_TOKEN) REFERENCES ComplaintToken(T_ID),
    FOREIGN KEY (U_ID) REFERENCES Users(U_ID)
);

CREATE TABLE loggedInSucessfully(
	email VARCHAR(255),
    loggedTime datetime,
);

select * from loggedInSucessfully

drop table loggedInSucessfully

select U_EMAIL
from users
where U_ROLE = 'Student'

Drop database SEProject

Select * from DegreeIssuanceForm

select U_ROLE from USERS where U_EMAIL = 'mansoor@gmail.com'


USE master;
ALTER DATABASE SEProject SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE SEProject;
	
SELECT D_SUBMISSION FROM DegreeIssuanceForm
