-- cau query show list course trong GradeSemester
select s.courseID, courseName from Study s inner join Course c
on s.courseID=c.courseID
where s.semester=? and  username=?

--cau query show bang diem 1 mon trong GradeSemester
select Assessment.gradeCategory,Weight,value,[index],SUM(Weight*value)/100 as total 
from Assessment inner join Student_Assessment
on Assessment.courseID= Student_Assessment.courseID and Assessment.gradeCategory=Student_Assessment.gradeCategory
where Assessment.courseID=? and username=?
group by Assessment.courseID,Assessment.gradeCategory,Weight,value,[index]
order by [index] asc

--cau query show gradetranscipt
with t as 
(select s.userName,s.courseID,c.courseName,c.credit, SUM(weight*value)/100 as total
from Study s inner join Course c on s.courseID=c.courseID
inner join Student_Assessment sa on sa.courseID=s.courseID
inner join Assessment a on a.courseID= sa.courseID and a.gradeCategory=sa.gradeCategory
where s.userName='huonglmhe160632'
group by weight, value, sa.gradeCategory,s.courseID,s.userName,c.credit,c.courseName)
select t.courseID,t.courseName,t.credit, SUM(t.total) as Grade
from t
group by t.courseID,t.courseName,t.credit

--cho giao vien chon lop
select distinct GroupName
from [Group]
where userName=?

--cho giao vien chon mon
select distinct courseID 
from [Group] 
where userName=? and GroupName=?

--hien thi list student trong lop va diem thanh phan
select displayName, ass.gradeCategory, ass.Weight,value,ass.[index]
from Account acc inner join Account_Group ag on acc.userName = ag.userName
inner join Assessment ass on ass.courseID=ag.courseID
left join Student_Assessment sa on ass.courseID= sa.courseID and ass.gradeCategory=sa.gradeCategory
where ag.courseID=?
order by displayName asc, [index] asc
