create table Student(
userName nvarchar(50) primary key not null ,
ID nvarchar(8) not null,
displayName nvarchar(50) not null,
[password] varchar(50) not null,
)

create table Course(
courseID varchar(10) primary key not null,
courseName nvarchar(50) not null,
credit int not null,
)


create table Study(
userName nvarchar(50),
courseID varchar(10),
semester varchar(50),
Primary key (userName,courseID),
foreign key (userName) references Student(userName),
foreign key (courseID) references Course(courseID),
)


create table Assessment(
courseID varchar(10),
GradeCategory varchar(20),
Primary key (courseID,GradeCategory),
[Weight] int,
foreign key (courseID) references Course(courseID),
)
drop table Assessment
create table Student_Assessment(
userName nvarchar(50),
courseID varchar(10),
GradeCategory varchar(20),
[value] float,
Primary key (userName,courseID,GradeCategory),
foreign key (userName) references Student(userName),
foreign key (courseID,GradeCategory) references Assessment(courseID,GradeCategory),
)

create table Teacher(
userName nvarchar(50) primary key not null ,
displayName nvarchar(50) not null,
[password] varchar(50) not null,
)

create table [Group](
GroupName varchar(6) not null,
courseID varchar(10),
userName nvarchar(50),
Primary key (GroupName,courseID),
foreign key (userName) references Teacher(userName),
foreign key (courseID) references Course(courseID),
)
drop table [Group]