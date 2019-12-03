use "qiuhuan_3117004993";

drop view excellent;
go
create view excellent as
select b.studentId, Sname, AVG(Grade) as avgs
from student b, SG y
where b.studentId = y.studentId
group by b.studentId, Sname, b.deptId
having AVG(Grade) >= ALL 
(
	select AVG(z.Grade)
	from student c, SG z
	where c.studentId = z.studentId and b.deptId = c.deptId
	group by c.studentId
);
drop view S_AVG;
go
create view S_AVG as
select student.studentId, student.Sname, sex, dateDiff(day, birthday, getdate())/365 AS Sage, dept.deptName, course.courseId, course.Cname, SG.Grade
from SG, student, dept, course
where student.studentId = SG.studentId and student.deptId = dept.deptId and student.studentId = SG.studentId and SG.courseId = course.courseId;

select *
from S_AVG;

go
alter view S_AVG as
select student.studentId, student.Sname, sex, dateDiff(day, birthday, getdate())/365 AS Sage, dept.deptName, course.courseId, course.Cname, SG.Grade, YEAR(GETDATE()) as nowaday
from SG, student, dept, course
where student.studentId = SG.studentId and student.deptId = dept.deptId and student.studentId = SG.studentId and SG.courseId = course.courseId;

go
select *
from S_AVG;

drop table greed;

select *
into greed
from (
	select teacher.teacherId, courseNew.courseId
	from teacher, courseNew
	where teacher.teacherId = courseNew.teacherId
)a;

alter table greed add grd varchar(10);

update greed
set grd = 'ÓÅÐã'
where greed.courseId in (
	select SG.courseId
	from SG
	Group by SG.courseId, Grade
	having AVG(Grade) >= 90
);

select grd
from teacher, greed
where teacher.teacherId = greed.teacherId and teacher.Tname = 'ÕÅÔÆ';