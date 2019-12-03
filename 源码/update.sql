use "qiuhuan_3117004993";

update SG
set Grade = Grade + 2
where courseId = (
	select courseId
	from course
	where Cname = '���ݿ�SQL'
);

update book
set Pdate = GETDATE()
where Bname = '�����ݿ�ԭ��';

delete from book
where bookId not in (
	select bookId
	from bookChoose
);

update bookChoose
set number = (
	select count(studentId)
	from SG
	group by courseId
	having SG.courseId = bookChoose.courseId
)+2;
go
exec sp_helpindex 'SG';