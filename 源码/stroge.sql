use qiuhuan_3117004993;


if (object_id('list_student_department', 'P') is not null)
    drop proc list_student_department
go
create procedure list_student_department (@deptId int) 
as
begin
	declare curse cursor for
		select studentId, Sname, sex, dept.deptName, birthday
		from student, dept
		where student.deptId = @deptId and student.deptId = dept.deptId
	open curse
	fetch next from curse
	while @@FETCH_STATUS=0
		fetch next from curse
	close curse
	deallocate curse
end
go

--Ö´ÐÐ´æ´¢
exec list_student_department @deptId='1'

go
alter procedure list_student_department(@deptId int)
as
begin
   declare curse2 cursor for
		select studentId, Sname, dept.deptName, birthday
		from student, dept
		where student.deptId = @deptId and student.deptId = dept.deptId
	open curse2
	fetch next from curse2
	while @@FETCH_STATUS=0
		fetch next from curse2
	close curse2
	deallocate curse2
end
go

--Ö´ÐÐ´æ´¢
exec list_student_department @deptId='1'

--É¾³ý´æ´¢
--drop procedure list_student_department;

