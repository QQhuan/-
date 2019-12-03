use qiuhuan_3117004993;

--1
IF EXISTS(
	SELECT *
	FROM sys .triggers
	WHERE name = N'diffName'
)
    DROP TRIGGER diffName
go
--�����޸�������ѧ������������ϡ�*��
create trigger diffName
on student
after insert
as 
begin
	declare @name varchar(50);
	declare @Sid int;
	select @name = Sname from inserted; --������������
	select @Sid = studentId from inserted; --��������ѧ��
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
--��������
insert into student(Sname, studentId, deptId)
values('���', '6', '1');

--2
IF EXISTS(
	SELECT *
	FROM sys .triggers
	WHERE name = N'newGreed'
)
    DROP TRIGGER newGreed
go
--�Զ��޸���ʦ�����۵ȼ�
create trigger newGreed
on SG
after update, insert, delete
as 
begin
	update greed
	set grd = '����'
	where greed.courseId in (
		select SG.courseId
		from SG
		Group by SG.courseId, Grade
		having AVG(Grade) >= 90
	);
	update greed
	set grd = '����'
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
--ɾ��ѧ��ʱ������ɾ���ɼ�
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
