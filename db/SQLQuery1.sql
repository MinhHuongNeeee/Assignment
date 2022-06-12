
create table Student(
userName nvarchar(50) primary key not null ,
ID nvarchar(8) not null,
displayName nvarchar(50) not null,
[password] varchar(50) not null,
)

create table Course(
courseID varchar(10) primary key not null,
courseName nvarchar(50) not null,
)


create table Study(
userName nvarchar(50),
courseID varchar(10),
semester varchar(50),
Primary key (userName,courseID),
foreign key (userName) references Student(userName),
foreign key (courseID) references Course(courseID),
)


create table GradeDetail(
userName nvarchar(50),
courseID varchar(10),
GradeCategory varchar(20),
Primary key (userName,courseID,GradeCategory),
[Weight] int,
[Value] float,
foreign key (userName,courseID) references Study(userName,courseID),

)
