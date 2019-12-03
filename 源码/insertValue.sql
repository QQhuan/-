USE qiuhuan_3117004993;
GO
/*����dept*/
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('1', '�����ѧԺ', '����', '1351234568');
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('2', '�Զ���ѧԺ', '����������', '15521154987');
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('3', '�����ѧԺ', '��', '15521154948');
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('4', '��ϢѧԺ', '��С��', '15552111546');
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('5', '����ѧԺ', '������', '13745898954');

/*����student*/
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('311', '���', '��', '1', '1999-01-15');
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('312', '����', 'Ů', '3', '1999-12-11');
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('313', '����', '��', '2', '2000-07-23');
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('314', '����', '��', '5', '1998-12-28');
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('315', '����', 'Ů', '4', '1991-06-19');

/*����course*/
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('1', '����ϵͳ', '6', '24');
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('2', '���ݿ�', '2', '24');
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('3', '�㷨���', '3', '24');
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('4', '���ݽṹ', '4', '24');
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('5', 'Ӣ��', '1', '24');

/*����SG*/
INSERT
INTO SG(studentId, courseId, Grade)
VALUES('311', '1', '100');
INSERT
INTO SG(studentId, courseId, Grade)
VALUES('312', '2', '99');
INSERT
INTO SG(studentId, courseId, Grade)
VALUES('313', '3', '90');
INSERT
INTO SG(studentId, courseId, Grade)
VALUES('314', '4', '95');
INSERT
INTO SG(studentId, courseId, Grade)
VALUES('315', '5', '96');

/*����teacher*/
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('1', '����', 'Ů', '1', '19850806', '2008-01-30');
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('2', '����', '��', '2', '19880128', '1996-01-30');
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('3', '������', 'Ů', '3', '19900706', '2017-01-30');
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('4', '����', '��', '4', '19840730', '2019-01-30');
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('5', '������', '��', '5', '19801207', '2000-01-30');


/*����TeacherCourse*/
INSERT
INTO TeacherCourse(teacherId, courseId)
VALUES('1', '1');
INSERT
INTO TeacherCourse(teacherId, courseId)
VALUES('2', '2');
INSERT
INTO TeacherCourse(teacherId, courseId)
VALUES('3', '3');
INSERT
INTO TeacherCourse(teacherId, courseId)
VALUES('4', '4');
INSERT
INTO TeacherCourse(teacherId, courseId)
VALUES('5', '5');


/*����book*/
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('1', '������ϵͳ��', '�㹤����', '50.00', '2017-07-07');
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('2', '�����ݿ⡷', '�廪����', '33.00', '2018-01-06');
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('3', '���㷨��ơ�', '��е����', '80.00', '2015-09-09');
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('4', '�����ݽṹ��', '�׳�����', '40.00', '2012-10-10');
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('5', '��Ӣ��2��', '�ߵȳ�����', '23.00', '2017-02-02');


/*����bookChoose*/
INSERT
INTO bookChoose(courseId, bookId, number)
VALUES('1', '1', '1000');
INSERT
INTO bookChoose(courseId, bookId, number)
VALUES('2', '2', '2000');
INSERT
INTO bookChoose(courseId, bookId, number)
VALUES('3', '3', '1300');
INSERT
INTO bookChoose(courseId, bookId, number)
VALUES('4', '4', '1700');
INSERT
INTO bookChoose(courseId, bookId, number)
VALUES('5', '5', '3000');

/*����classroom*/
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('1', '��1', '100');
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('2', '��2', '200');
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('3', '��3', '150');
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('4', '��4', '120');
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('5', '��5', '180');

/*����courseNew*/
INSERT
INTO courseNew(courseId, teacherId, roomId)
VALUES('1', '1', '1');
INSERT
INTO courseNew(courseId, teacherId, roomId)
VALUES('2', '2', '2');
INSERT
INTO courseNew(courseId, teacherId, roomId)
VALUES('3', '3', '3');
INSERT
INTO courseNew(courseId, teacherId, roomId)
VALUES('4', '4', '4');
INSERT
INTO courseNew(courseId, teacherId, roomId)
VALUES('5', '5', '5');