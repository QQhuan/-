USE qiuhuan_3117004993;
GO
/*插入dept*/
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('1', '计算机学院', '马东域', '1351234568');
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('2', '自动化学院', '阿尔托莉雅', '15521154987');
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('3', '外国语学院', '零', '15521154948');
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('4', '信息学院', '黄小明', '15552111546');
INSERT 
INTO dept(deptId, deptName, deptManager, Mphone)
VALUES('5', '环境学院', '蔡先生', '13745898954');

/*插入student*/
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('311', '邱焕', '男', '1', '1999-01-15');
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('312', '许坤', '女', '3', '1999-12-11');
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('313', '韩信', '男', '2', '2000-07-23');
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('314', '李信', '男', '5', '1998-12-28');
INSERT
INTO student(studentId, Sname, sex, deptId, birthday)
VALUES('315', '赵信', '女', '4', '1991-06-19');

/*插入course*/
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('1', '操作系统', '6', '24');
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('2', '数据库', '2', '24');
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('3', '算法设计', '3', '24');
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('4', '数据结构', '4', '24');
INSERT 
INTO course(courseId, Cname, Cscore, study_time)
VALUES('5', '英语', '1', '24');

/*插入SG*/
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

/*插入teacher*/
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('1', '李宇', '女', '1', '19850806', '2008-01-30');
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('2', '蔡邕', '男', '2', '19880128', '1996-01-30');
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('3', '霍建华', '女', '3', '19900706', '2017-01-30');
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('4', '张云', '男', '4', '19840730', '2019-01-30');
INSERT
INTO teacher(teacherId, Tname, sex, deptId, birth, joindate)
VALUES('5', '刘振勇', '男', '5', '19801207', '2000-01-30');


/*插入TeacherCourse*/
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


/*插入book*/
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('1', '《操作系统》', '广工出版', '50.00', '2017-07-07');
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('2', '《数据库》', '清华出版', '33.00', '2018-01-06');
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('3', '《算法设计》', '机械出版', '80.00', '2015-09-09');
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('4', '《数据结构》', '献出版社', '40.00', '2012-10-10');
INSERT
INTO book(bookId, Bname, Press, price, Pdate)
VALUES('5', '《英语2》', '高等出版社', '23.00', '2017-02-02');


/*插入bookChoose*/
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

/*插入classroom*/
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('1', '教1', '100');
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('2', '教2', '200');
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('3', '教3', '150');
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('4', '教4', '120');
INSERT
INTO classroom(roomId, roomLocation, contain)
VALUES('5', '教5', '180');

/*插入courseNew*/
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