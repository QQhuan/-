use qiuhuan_3117004993;

/*查询所有学生的学号+姓名+性别+年龄*/
select studentId, Sname, sex, dateDiff(day, birthday, getdate())/365 AS Sage 
from student;

/*查询某院系的全部学生的学号+姓名+性别+出生日期*/
select student.studentId,Sname, sex, birthday
from student, dept
where student.deptId = dept.deptId and dept.deptName = '计算机学院';

/*查询教材名称中出现SQL字样的教材信息*/
select * 
from book
where Bname like '%SQL%';

/*查询在1997年以后出生的计算机学院学生的学号+姓名+性别+出生日期*/
select student.studentId, Sname, sex, birthday
from student, dept
where student.deptId = dept.deptId and dept.deptName = '计算机学院' and DATEDIFF(day, '1997-01-01', student.birthday) > 0;

/*查询年龄不在22-26之间的学生的学号+院系编号+姓名*/
select studentId, deptId, Sname
from student
where DATEDIFF(day, birthday, getdate())/365 not between 0 and 26;

/*查询全部学生的学号+姓名+性别+所在院系名称+选课信息*/
select student.studentId, Sname, sex, deptName, SG.Grade, course.*
from student, dept, course, SG
where student.deptId = dept.deptId and SG.studentId = student.studentId and SG.courseId = course.courseId;

/*查询学生不及格的情况列出不及格学生的学号+姓名+不及格的课程名称*/
select student.studentId, Sname, Cname
from student, course, SG
where SG.studentId = student.studentId and SG.courseId = course.courseId and SG.Grade < 60;

/*通过查询为教师生成的课程信息，包括：教师院系+教师姓名+任课名称+上课地点+使用的教材名称*/
select dept.deptName, teacher.Tname, course.Cname, classroom.roomLocation, book.Bname
from teacher, book, course, classroom, dept, TeacherCourse, courseNew, bookChoose
where teacher.deptId = dept.deptId and TeacherCourse.teacherId = teacher.teacherId and TeacherCourse.courseId = course.courseId 
and courseNew.courseId = TeacherCourse.courseId and courseNew.teacherId = TeacherCourse.courseId and classroom.roomId = courseNew.roomId
and courseNew.courseId = bookChoose.courseId and bookChoose.bookId = book.bookId

/*查询没有选修课程名中包含“数据库”课程的学生，列出学生的学号和姓名*/
select student.studentId, Sname
from student
where not exists 
	(
		select *
		from SG, course
		where student.studentId = SG.studentId and SG.courseId = course.courseId and course.Cname like '%数据库%'
	)

/*检索年龄为20岁，同时至少选修了一门学分3以上的课程的学生的姓名和院系名称*/
select student.Sname, dept.deptName
from student, dept, SG, course
where DATEDIFF(day, birthday, getdate())/365 = '20' and student.deptId = dept.deptId and SG.studentId = student.studentId and SG.courseId = course.courseId and course.Cscore >= '3'
group by student.Sname, dept.deptName
having count(*) >= 1;

/*可选： 求每个系中平均分最高的学生的学号和姓名、及其平均成绩*/
select b.studentId, Sname, AVG(Grade) as avg
from student b, SG y
where b.studentId = y.studentId
group by b.studentId, Sname, b.deptId
having AVG(Grade) >= ALL 
(
	select AVG(z.Grade)
	from student c, SG z
	where c.studentId = z.studentId and b.deptId = c.deptId
	group by c.studentId
)

/*
select studentId
from  
(
	select c.studentId, c.deptId, AVG(z.Grade) as avg
	from student c, SG z
	where c.studentId = z.studentId
	group by c.studentId, c.deptId
) a
where avg >= ALL
(
	select AVG(y.Grade) as avg
	from student x, SG y
	where x.studentId = y.studentId and a.deptId = x.deptId
	group by x.studentId
) 
*/
	