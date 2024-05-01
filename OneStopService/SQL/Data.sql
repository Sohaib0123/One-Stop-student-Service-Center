USE SEProject;

Drop database SEProject

select * from DegreeToken

SELECT F_ID FROM DegreeIssuanceForm WHERE D_STATUS = 'Pending'

INSERT INTO Users VALUES
(1, 'John Doe', 'Student', 'john.doe@example.com', 'password1'),
(2, 'Alice Johnson', 'FYP', 'alice.j@example.com', 'password2'),
(3, 'Bob Smith', 'Finance', 'bob.smith@example.com', 'password3'),
(4, 'Carol Danvers', 'Admin', 'carol.d@example.com', 'password4'),
(5, 'Dave Wilson', 'Director', 'dave.w@example.com', 'password5'),
(6, 'Emily Clark', 'Student', 'emily.clark@example.com', 'password6'),
(7, 'Frank Ocean', 'Student', 'frank.ocean@example.com', 'password7'),
(8, 'Grace Lee', 'Student', 'grace.lee@example.com', 'password8'),
(9, 'Harry Potter', 'Student', 'harry.potter@example.com', 'password9'),
(10, 'Isla White', 'Student', 'isla.white@example.com', 'password10');

INSERT INTO DegreeIssuanceForm VALUES
(1, 1, '123 Main St, Cityville', '12345-6789012-3', '+1234567890', '2024-04-28', 'Pending'),
(2, 1, '456 Oak Ave, Townsville', '23456-7890123-4', '+2345678901', '2024-04-27', 'Processing'),
(3, 6, '789 Elm Rd, Villagetown', '34567-8901234-5', '+3456789012', '2024-04-26', 'Completed'),
(4, 6, '101 Pine Ln, Hamletville', '45678-9012345-6', '+4567890123', '2024-04-25', 'Pending'),
(5, 7, '202 Cedar St, Suburbia', '56789-0123456-7', '+5678901234', '2024-04-24', 'Processing'),
(6, 7, '303 Maple Dr, Countryside', '67890-1234567-8', '+6789012345', '2024-04-23', 'Completed'),
(7, 8, '404 Birch Ave, Outskirts', '78901-2345678-9', '+7890123456', '2024-04-22', 'Pending'),
(8, 8, '505 Walnut Rd, Downtown', '89012-3456789-0', '+8901234567', '2024-04-21', 'Processing'),
(9, 9, '606 Ash St, Uptown', '90123-4567890-1', '+9012345678', '2024-04-20', 'Completed'),
(10, 10, '707 Spruce Ln, Riverside', '01234-5678901-2', '+0123456789', '2024-04-19', 'Pending');


INSERT INTO ComplaintForm VALUES
(1, 1, 'Pending', 'Delay in processing degree issuance form', '2024-04-28'),
(2, 6, 'Processing', 'Incorrect address provided in degree issuance form', '2024-04-27'),
(3, 7, 'Completed', 'Issues with contacting the degree issuance office', '2024-04-26'),
(4, 8, 'Pending', 'Error in CNIC information on degree issuance form', '2024-04-25'),
(5, 9, 'Processing', 'Phone number update needed for degree issuance form', '2024-04-24'),
(6, 10, 'Completed', 'Missing submission date on degree issuance form', '2024-04-23'),
(7, 1, 'Pending', 'Address verification required for degree issuance form', '2024-04-22'),
(8, 6, 'Processing', 'Clarification needed on degree issuance form submission', '2024-04-21'),
(9, 7, 'Completed', 'Status update required for degree issuance form', '2024-04-20'),
(10, 8, 'Pending', 'Issue with degree issuance form submission portal', '2024-04-19');


INSERT INTO DegreeToken VALUES
(1, 1, 'Pending', 'Pending', 'Request is Pending' , '', ''),
(2, 2, 'Accepted', 'Pending', 'One Stop Admin has started processing the request', 'All clear', ''),
(3, 3, 'Accepted', 'Accepted', 'Request is delivered to Finance', 'All good', 'Fee paid');

INSERT INTO ComplaintToken VALUES
(1, 1, 'Pending', 60, '2023-04-20'),
(2, 2, 'Accepted', 30, '2023-04-21'),
(3, 3, 'Pending', 60, '2023-04-24');

INSERT INTO Payments VALUES
(1, 1, 'Unpaid', 'Processing Fee', 200.00, 0.00),
(2, 2, 'Paid', 'Degree Fee', 150.00, 150.00),
(3, 3, 'Unpaid', 'Degree Fee', 150.00, 0.00);

--Queries
SELECT 
    df.F_ID AS FormID, 
    u.U_EMAIL AS UserEmail, 
    df.D_SUBMISSION AS SubmissionDate, 
    df.D_STATUS AS FormStatus
FROM 
    DegreeIssuanceForm df
INNER JOIN 
    Users u ON df.U_ID = u.U_ID;

SELECT 
    ComplaintForm.C_ID,
    Users.U_EMAIL,
    ComplaintForm.C_SUBMISSION,
    ComplaintForm.C_STATUS
FROM 
    ComplaintForm
JOIN 
    Users ON ComplaintForm.U_ID = Users.U_ID

SELECT D_SUBMISSION FROM DegreeIssuanceForm

SELECT dt.T_ID AS TokenID, u.U_EMAIL AS UserEmail, df.D_SUBMISSION AS SubmissionDate, dt.T_STATUS AS TokenStatus 
FROM DegreeToken dt INNER JOIN DegreeIssuanceForm df ON dt.F_ID = df.F_ID INNER JOIN Users u ON df.U_ID = u.U_ID 
where T_STATUS = 'One Stop Admin has started processing the request'  OR T_STATUS = 'Request is delivered to FYP committee'  OR T_STATUS = 'Request is delivered to Finance';



SELECT CONVERT(VARCHAR(10), D_SUBMISSION, 120) AS D_SUBMISSION
FROM DegreeIssuanceForm;

select * from DegreeIssuanceForm