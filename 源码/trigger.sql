use qiuhuan_3117004993;

--1
IF EXISTS(
	SELECT *
	FROM sys .triggers
	WHERE name = N'diffName'
)
    DROP TRIGGER diffName
go
--监听修改重名的学生，重名则加上‘*’
create trigger diffName
on student
after insert
as 
begin
	declare @name varchar(50);
	declare @Sid int;
	select @name = Sname from inserted; --获得新添的姓名
	select @Sid = studentId from inserted; --获得新添的学号
	if exists(
		select *
		from student
		where Sname = @name and studentId != @Sid
	)
		update student
		set Sname = Sname+'*'
		where studentId = @Sid;
end

go
delete 
from student
where studentId = '6';
--测试重名
insert into student(Sname, studentId, deptId)
values('邱焕', '6', '1');

--2
IF EXISTS(
	SELECT *
	FROM sys .triggers
	WHERE name = N'newGreed'
)
    DROP TRIGGER newGreed
go
--自动修改老师的评价等级
create trigger newGreed
on SG
after update, insert, delete
as 
begin
	update greed
	set grd = '优秀'
	where greed.courseId in (
		select SG.courseId
		from SG
		Group by SG.courseId, Grade
		having AVG(Grade) >= 90
	);
	update greed
	set grd = '良好'
	where greed.courseId not in (
		select SG.courseId
		from SG
		Group by SG.courseId, Grade
		having AVG(Grade) >= 90
	);
end

go
update SG
set Grade = '90'
where courseId = '3';

--3
IF EXISTS(
	SELECT *
	FROM sys .triggers
	WHERE name = N'deleteStuent'
)
    DROP TRIGGER deleteStuent
go
--删除学生时，级联删除成绩
create trigger deleteStuent
on student
after delete
as 
begin
	declare @id int;
	select @id = studentId from deleted;
	delete 
	from SG
	where SG.studentId = @id;
end

go
delete 
from student
where student.studentId = 6;
