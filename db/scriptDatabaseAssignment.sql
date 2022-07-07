use PRJ301_Assignment
create table [Role](
rid int primary key not null,
rname nvarchar(150) not null,
)
create table Account(
userName nvarchar(50) primary key not null ,
displayName nvarchar(50) not null,
[password] varchar(50) not null,
gender bit,
dob date,
[address] nvarchar(150),
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


create table Assessment(
courseID varchar(10),
gradeCategory varchar(20),
Primary key (courseID,gradeCategory),
[Weight] int,
[index] int,
foreign key (courseID) references Course(courseID),
)

create table Student_Assessment(
said int primary key not null,
userName nvarchar(50),
courseID varchar(10),
gradeCategory varchar(20),
[value] float,
foreign key (userName) references Account(userName),
foreign key (courseID,GradeCategory) references Assessment(courseID,gradeCategory),
)
drop table Assessment
create table [Group](
GroupName varchar(6) not null,
courseID varchar(10),
userName nvarchar(50),
Primary key (GroupName,courseID),
foreign key (userName) references Account(userName),
foreign key (courseID) references Course(courseID),
)
drop table Account_Group
create table Account_Group(
GroupName varchar(6) ,
courseID varchar(10),
userName nvarchar(50),
Primary key (GroupName,courseID,userName),
foreign key (GroupName,courseID) references [Group](GroupName,courseID),
foreign key (userName) references Account(userName),
)

insert into Account values
('anpbhe161234',N'Phạm Bình An',12345,0,'2001-05-06',N'Quảng Ninh',1),
('hoakt',N'Khuất Thị Hoa',12345,1,'1990-07-20',N'Hưng Yên',2),
('huonglmhe160632',N'Lưu Minh Hương',12345,1,'2002-09-02',N'Thái Bình',1),
('kienpthe167892',N'Phạm Trung Kiên',12345,0,'2000-03-02',N'Lào Cai',1),
('lannthe160987',N'Nguyễn Thị Lan',12345,1,'2002-12-09',N'Nam Định',1),
('sonnt5',N'Ngô Tùng Sơn',12345,0,'1995-10-10',N'Hà Nội',2),
('trungdt',N'Đinh Thành Trung',12345,0,'1985-03-10',N'Hải Phòng',2)

insert into Study values
('huonglmhe160632','CSI104','Summer2021','2021-05-10'),
('huonglmhe160632','DBI202','Spring2022','2022-01-04'),
('huonglmhe160632','EDT202c','Spring2022','2022-01-04'),
('huonglmhe160632','JPD113','Fall2021','2021-09-05'),
('huonglmhe160632','MAE101','Summer2021','2021-05-10'),
('huonglmhe160632','MAS291','Summer2022','2022-05-09'),
('huonglmhe160632','PRJ301','Summer2022','2021-05-09'),
('huonglmhe160632','SSG104','Fall2021','2021-09-05')
insert into [Group] values
('SE1625','CSI104','anhvn'),
('SE1625','DBI202','sonnt5'),
('SE1625','JPD113','hoakt'),
('SE1634','DBI202','sonnt5'),
('SE1634','PRJ301','sonnt5'),
('SE1634','SSG104','hoakt')

insert into Account_Group values
('SE1625','DBI202','huonglmhe160632'),
('SE1625','DBI202','kienpthe167892'),
('SE1634','DBI202','anpbhe161234'),
('SE1634','DBI202','lannthe160987'),
('SE1625','CSI104','huonglmhe160632'),
('SE1625','CSI104','kienpthe167892'),
('SE1625','CSI104','anpbhe161234'),
('SE1625','CSI104','lannthe160987'),
('SE1634','PRJ301','huonglmhe160632'),
('SE1634','PRJ301','kienpthe167892'),
('SE1634','PRJ301','anpbhe161234'),
('SE1634','PRJ301','lannthe160987'),
('SE1625','JPD113','huonglmhe160632'),
('SE1625','JPD113','kienpthe167892'),
('SE1625','JPD113','anpbhe161234'),
('SE1625','JPD113','lannthe160987'),
('SE1634','SSG104','huonglmhe160632'),
('SE1634','SSG104','lannthe160987'),
('SE1634','SSG104','kienpthe167892')

drop table Student_Assessment
insert into Student_Assessment (userName,courseID,gradeCategory,[value]) values
('huonglmhe160632','SSG104','Activity',-100),
('huonglmhe160632','SSG104','Project',-100),
('huonglmhe160632','SSG104','Quiz',-100),
('huonglmhe160632','SSG104','Final Exam',-100),

('huonglmhe160632','CSI104','Progress Test',-100),
('huonglmhe160632','CSI104','Presentation',-100),
('huonglmhe160632','CSI104','Lab',-100),
('huonglmhe160632','CSI104','Final Exam',-100)

('quynhpnhe167829','PRJ301','Progress Test',-100),
('quynhpnhe167829','PRJ301','workshop',-100),
('quynhpnhe167829','PRJ301','Assignment',-100),
('quynhpnhe167829','PRJ301','Practice Exam',-100),
('quynhpnhe167829','PRJ301','Final Exam',-100),

('anpbhe161234','PRJ301','Progress Test',-100),
('anpbhe161234','PRJ301','workshop',-100),
('anpbhe161234','PRJ301','Assignment',-100),
('anpbhe161234','PRJ301','Practice Exam',-100),
('anpbhe161234','PRJ301','Final Exam',-100),

('kienpthe167892','PRJ301','Progress Test',-100),
('kienpthe167892','PRJ301','workshop',-100),
('kienpthe167892','PRJ301','Assignment',-100),
('kienpthe167892','PRJ301','Practice Exam',-100),
('kienpthe167892','PRJ301','Final Exam',-100),

('huonglmhe160632','PRJ301','Progress Test',-100),
('huonglmhe160632','PRJ301','workshop',-100),
('huonglmhe160632','PRJ301','Assignment',-100),
('huonglmhe160632','PRJ301','Practice Exam',-100),
('huonglmhe160632','PRJ301','Final Exam',-100),

('lannthe160987','PRJ301','Progress Test',-100),
('lannthe160987','PRJ301','workshop',-100),
('lannthe160987','PRJ301','Assignment',-100),
('lannthe160987','PRJ301','Practice Exam',-100),
('lannthe160987','PRJ301','Final Exam',-100),

('huonglmhe160632','JPD113','Mid Term',9),
('huonglmhe160632','JPD113','Small Test',9),
('huonglmhe160632','JPD113','Final Exam',8.5),

('huonglmhe160632','EDT202c','Practice Exam',3),
('huonglmhe160632','EDT202c','Final Exam',4),

('huonglmhe160632','MAE101','Assignment',-100),
('huonglmhe160632','MAE101','Progress Test',8.5),
('huonglmhe160632','MAE101','Final Exam',-100),

('huonglmhe160632','CSI104','Progress Test',-100),
('huonglmhe160632','CSI104','Presentation',-100),
('huonglmhe160632','CSI104','Lab',-100),
('huonglmhe160632','CSI104','Final Exam',-100)

insert into Assessment values 
('MAE101','Assignment',30,1),
('MAE101','Progress Test',30,2),
('MAE101','Final Exam',30,3),
('EDT202c','Theory Exam',50,1),
('EDT202c','Practice Exam',30,2),
('MAS291','Computer Project',15,1),
('MAS291','Assignment',20,2),
('MAS291','Progress Test',30,3),
('MAS291','Final Exam',35,4)
