use qiuhuan_3117004993;

/*��ѯ����ѧ����ѧ��+����+�Ա�+����*/
select studentId, Sname, sex, dateDiff(day, birthday, getdate())/365 AS Sage 
from student;

/*��ѯĳԺϵ��ȫ��ѧ����ѧ��+����+�Ա�+��������*/
select student.studentId,Sname, sex, birthday
from student, dept
where student.deptId = dept.deptId and dept.deptName = '�����ѧԺ';

/*��ѯ�̲������г���SQL�����Ľ̲���Ϣ*/
select * 
from book
where Bname like '%SQL%';

/*��ѯ��1997���Ժ�����ļ����ѧԺѧ����ѧ��+����+�Ա�+��������*/
select student.studentId, Sname, sex, birthday
from student, dept
where student.deptId = dept.deptId and dept.deptName = '�����ѧԺ' and DATEDIFF(day, '1997-01-01', student.birthday) > 0;

/*��ѯ���䲻��22-26֮���ѧ����ѧ��+Ժϵ���+����*/
select studentId, deptId, Sname
from student
where DATEDIFF(day, birthday, getdate())/365 not between 0 and 26;

/*��ѯȫ��ѧ����ѧ��+����+�Ա�+����Ժϵ����+ѡ����Ϣ*/
select student.studentId, Sname, sex, deptName, SG.Grade, course.*
from student, dept, course, SG
where student.deptId = dept.deptId and SG.studentId = student.studentId and SG.courseId = course.courseId;

/*��ѯѧ�������������г�������ѧ����ѧ��+����+������Ŀγ�����*/
select student.studentId, Sname, Cname
from student, course, SG
where SG.studentId = student.studentId and SG.courseId = course.courseId and SG.Grade < 60;

/*ͨ����ѯΪ��ʦ���ɵĿγ���Ϣ����������ʦԺϵ+��ʦ����+�ο�����+�Ͽεص�+ʹ�õĽ̲�����*/
select dept.deptName, teacher.Tname, course.Cname, classroom.roomLocation, book.Bname
from teacher, book, course, classroom, dept, TeacherCourse, courseNew, bookChoose
where teacher.deptId = dept.deptId and TeacherCourse.teacherId = teacher.teacherId and TeacherCourse.courseId = course.courseId 
and courseNew.courseId = TeacherCourse.courseId and courseNew.teacherId = TeacherCourse.courseId and classroom.roomId = courseNew.roomId
and courseNew.courseId = bookChoose.courseId and bookChoose.bookId = book.bookId

/*��ѯû��ѡ�޿γ����а��������ݿ⡱�γ̵�ѧ�����г�ѧ����ѧ�ź�����*/
select student.studentId, Sname
from student
where not exists 
	(
		select *
		from SG, course
		where student.studentId = SG.studentId and SG.courseId = course.courseId and course.Cname like '%���ݿ�%'
	)

/*��������Ϊ20�꣬ͬʱ����ѡ����һ��ѧ��3���ϵĿγ̵�ѧ����������Ժϵ����*/
select student.Sname, dept.deptName
from student, dept, SG, course
where DATEDIFF(day, birthday, getdate())/365 = '20' and student.deptId = dept.deptId and SG.studentId = student.studentId and SG.courseId = course.courseId and course.Cscore >= '3'
group by student.Sname, dept.deptName
having count(*) >= 1;

/*��ѡ�� ��ÿ��ϵ��ƽ������ߵ�ѧ����ѧ�ź�����������ƽ���ɼ�*/
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
	