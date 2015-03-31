
CREATE TABLE UserAccount
(
id int IDENTITY(1,1) PRIMARY KEY,
firstName varchar(45) NOT NULL,
lastName varchar(45) NOT NULL,
userID varchar(45) NOT NULL UNIQUE,
password varchar(45) NOT NULL,
email varchar(45) NOT NULL,
securityQuestion varchar(45) NOT NULL,
securityAnswer varchar(45) NOT NULL,
type varchar(20) NOT NULL,
accountApproval bit
);

CREATE TABLE Project
(
id int IDENTITY(1,1) PRIMARY KEY,
name varchar(128) NOT NULL,
student_id int NOT NULL,
courseNumber varchar(15),
liveLink TEXT,
abstract TEXT,
screencastLink TEXT,
semester varchar(20),
dateCreated DATETIME DEFAULT GETDATE(),
highlighted bit
);

CREATE TABLE Committee
(
commitee_id int IDENTITY(1,1),
project_id int NOT NULL,
committeeEmail varchar(45) NOT NULL,
type varchar(45) NOT NULL,
primary key(project_id, committeeEmail)
);

CREATE TABLE ProjectSubmission
(
submission_id int IDENTITY(1,1),
project_id int NOT NULL,
document_id int NOT NULL,
type varchar(45) NOT NULL,
approved bit,
dateSubmitted varchar(45) DEFAULT GETDATE(),
primary key(submission_id)
);

CREATE TABLE Approval
(
submission_id int NOT NULL,
committee_id int NOT NULL,
approved bit,
primary key(submission_id, committee_id)
);

CREATE TABLE Documents
(
id int IDENTITY(1,1) PRIMARY KEY,
documentName varchar(45) NOT NULL,
documentLink varchar(45) NOT NULL
);

CREATE TABLE ProjectStatistics
(
project_id int NOT NULL PRIMARY KEY,
views int NOT NULL,
downloads int NOT NULL
);

CREATE TABLE Keyword
(
id int IDENTITY(1,1),
keyword varchar(45) NOT NULL PRIMARY KEY
);

CREATE TABLE ProjectKeywords
(
keyword_id int NOT NULL,
project_id int NOT NULL,
primary key(keyword_id, project_id)

);

CREATE TABLE Subscribers
(
keyword_id int NOT NULL,
email varchar(45) NOT NULL,
primary key(keyword_id, email)
);
