

drop database MentalHealthTracker;

CREATE DATABASE MentalHealthTracker;
GO

USE MentalHealthTracker;
GO
select*from MoodLogs
select*from Users
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE MoodLogs (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Mood NVARCHAR(50) check(Mood = 'Relaxed' OR Mood  = 'Happy' OR Mood =  'Angry' OR Mood = 'Excited' OR Mood = 'Anxious'),
    Note NVARCHAR(MAX),
    LogDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE Resources (
    ResourceID INT IDENTITY(1,1) PRIMARY KEY,
	UserID int,
    Description NVARCHAR(MAX),
    URL NVARCHAR(255)
	  FOREIGN KEY (UserID) REFERENCES Users(UserID)
); drop table Resources
GO

INSERT INTO Users (Username, PasswordHash, Email)
VALUES
('john_doe', 'hashed_password_123', 'john@example.com'),
('jane_smith', 'hashed_password_456', 'jane@example.com');
GO

INSERT INTO MoodLogs (UserID, Mood, Note)
VALUES
(1, 'Happy', 'Had a great day!'),
(2, 'Stressed', 'Lots of assignments to do.');
GO

INSERT INTO Resources (Title, Description, URL)
VALUES
('Helpline', '24/7 mental health support hotline', 'http://example.com/helpline'),
('Meditation Guide', 'Step-by-step guide for beginners', 'http://example.com/meditation');
GO

create proc 
UPDATE MoodLogs
SET Mood = 'Relaxed', Note = 'Managed to finish all tasks.'
WHERE LogID = 2;
GO

DELETE FROM Resources
WHERE ResourceID = 1;
GO

SELECT * FROM Users;
SELECT * FROM MoodLogs WHERE UserID = 1;
SELECT Title, URL FROM Resources;
GO

CREATE PROCEDURE GetUserMoodLogs
    @UserID INT
AS
BEGIN
    SELECT Mood, Note, LogDate 
    FROM MoodLogs 
    WHERE UserID = @UserID;
END;
GO

-- Call the stored procedure:
EXEC GetUserMoodLogs @UserID = 1;
GO

string connectionString = "Server=LAPTOP-USPIPJFI;Database=MentalHealthTracker;User ID=YourUsername;Password=YourPassword;";

SqlConnection con = new SqlConnection(

CREATE PROCEDURE usp_GetData
    @FilterValue NVARCHAR(50) = NULL -- Parameter for filtering (optional)
AS
BEGIN
    -- Prevent SQL injection by using proper filtering
    SET NOCOUNT ON;

    -- Query to handle "view all" or filtered data
    SELECT *
    FROM MoodLogs
    WHERE (@FilterValue IS NULL OR ColumnName = @FilterValue);

END;

exec usp_GetData

select *from Users