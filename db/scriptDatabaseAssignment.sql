
create table [Role](
rid int primary key not null,
rname nvarchar(150) not null,
)
create table Account(
userName nvarchar(50) primary key not null ,
displayName nvarchar(50) not null,
[password] varchar(50) not null,
rid int not null,
foreign key (rid) references [Role](rid),
)
create table Feature(
fid int primary key not null,
fname varchar(150),
url varchar(MAX),
)
create table Role_Feature(
rid int not null,
fid int not null,
Primary key (rid,fid),
foreign key (fid) references Feature(fid),
foreign key (rid) references [Role](rid),
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
[dateStart] date,
Primary key (userName,courseID),
foreign key (userName) references Account(userName),
foreign key (courseID) references Course(courseID),
)
drop table Student_Assessment

create table Assessment(
courseID varchar(10),
gradeCategory varchar(20),
Primary key (courseID,gradeCategory),
[Weight] int,
foreign key (courseID) references Course(courseID),
)

create table Student_Assessment(
userName nvarchar(50),
courseID varchar(10),
gradeCategory varchar(20),
[value] float,
[index] int,
Primary key (userName,courseID,gradeCategory),
foreign key (userName) references Account(userName),
foreign key (courseID,GradeCategory) references Assessment(courseID,gradeCategory),
)

create table [Group](
GroupName varchar(6) not null,
courseID varchar(10),
userName nvarchar(50),
Primary key (GroupName,courseID),
foreign key (userName) references Account(userName),
foreign key (courseID) references Course(courseID),
)