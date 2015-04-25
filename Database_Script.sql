
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
accountReason varchar(128) NOT NULL,
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
highlighted bit,
presentationDate TIMESTAMP,
presentationPlace varchar(20)
);

CREATE TABLE Committee
(
commitee_id int IDENTITY(1,1),
project_id int NOT NULL,
committeeName varchar(45) NOT NULL,
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
committeeComment varchar(256),
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


------------------------------PROCEDURE------------------------------
CREATE PROCEDURE InsertProjectStatistics
@ProjectId int,
@Type varchar(25)
AS
BEGIN
DECLARE @Cnt int
if( @Type='View')
BEGIN
      if exists(select * from ProjectStatistics where project_id=@ProjectId)
            BEGIN
                  SET @Cnt=0
                  SET @Cnt=(select  views from ProjectStatistics where project_id=@ProjectId)
                 
                  update   ProjectStatistics set views=(@Cnt+1) where project_id=@ProjectId
            END
      ELSE
            BEGIN
            insert into ProjectStatistics (project_id, views, downloads)
            values(@ProjectId,1,0)
            END
END
 
if( @Type='DownLoad')
BEGIN
      if exists(select * from ProjectStatistics where project_id=1)
            BEGIN
                  SET @Cnt=0
                  SET @Cnt=(select  downloads  from ProjectStatistics where project_id=1)
                  update   ProjectStatistics set downloads=(@Cnt+1) where project_id=@ProjectId
            END
      ELSE
            BEGIN
            insert into ProjectStatistics (project_id, views, downloads)
            values(@ProjectId,0,1)
            END
END
END

CREATE PROCEDURE [dbo].[UpdateProjectDetails] 
@ProjectID int,
@name varchar(128),
@student_id int,
@courseNumber int,
@liveLink varchar(MAX),
@abstract varchar(MAX),
@screencastLink text,
@semester varchar(20)
AS
BEGIN
Update Project
set name=@name,
courseNumber=@courseNumber,
liveLink=@liveLink,
abstract=@abstract,
screencastLink=@screencastLink,
semester=@semester
where ID=@ProjectID
END


-- SearchProject 'java'
CREATE PROCEDURE SearchProject
@KeyWord varchar(MAx)
AS
BEGIN
select   P.id, P.name, P.student_id, P.courseNumber,
 P.liveLink, P.abstract, P.screencastLink, P.semester, 
 P.dateCreated, P.highlighted,Ky.keyword,DS.documentName,DS.documentLink  from Project P
   left join ProjectSubmission PD on P.id=PD.project_id 
   left join documents DS on DS.id=PD.document_id
    join ProjectKeywords PK on P.id=PK.project_id 
   join Keyword Ky on Ky.id=PK.keyword_id
  WHERE     (Ky.keyword LIKE '%' + @KeyWord + '%') OR
                      (P.courseNumber LIKE '%' + @KeyWord + '%') OR
                      (P.abstract LIKE '%' + @KeyWord + '%') OR
                      (P.semester LIKE '%' + @KeyWord + '%')
  END
