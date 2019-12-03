use qiuhuan_3117004993;
DROP TABLE courseNew;
DROP TABLE classroom;
DROP TABLE bookChoose;
DROP TABLE book;
DROP TABLE TeacherCourse;
DROP TABLE teacher;
DROP TABLE SG;
DROP TABLE course;
DROP TABLE student;
DROP TABLE dept;
/*创建dept*/
CREATE TABLE dept
(
	deptId int PRIMARY KEY,
	deptName char(10) NOT NULL,
	deptManager char(10) NOT NULL,
	Mphone char(11)
);

/*创建student*/
CREATE TABLE student
(
	studentId int PRIMARY KEY,
	Sname char(10) NOT NULL,
	sex char(2),
	deptId int NOT NULL, FOREIGN KEY(deptId) REFERENCES dept(deptId),
	birthday date
);

/*创建course*/
CREATE TABLE course
(
	courseId int PRIMARY KEY,
	Cname char(10) NOT NULL,
	Cscore smallint,
	study_time int 
);

/*创建SG，成绩表*/
CREATE TABLE SG
(
	studentId int,
	courseId int, 
	Grade float(1) CHECK(Grade between 0 and 100),
	PRIMARY KEY(studentId,courseId),
	FOREIGN KEY(studentId) REFERENCES student(studentId) ON DELETE CASCADE,
	FOREIGN KEY(courseId) REFERENCES course(courseId)
);

/*创建teacher*/
CREATE TABLE teacher
(
	teacherId int PRIMARY KEY,
	Tname char(10) NOT NULL,
	sex char(2),
	deptId int NOT NULL, FOREIGN KEY(deptId) REFERENCES dept(deptId),
	birth date,
	joindate date
);

/*创建教师选课表*/
CREATE TABLE TeacherCourse
(
	teacherId int, 
	courseId int, 
	PRIMARY KEY(teacherId,courseId),
	FOREIGN KEY(teacherId) REFERENCES teacher(teacherId),
	FOREIGN KEY(courseId) REFERENCES course(courseId),
);

/*创建教材信息*/
Create TABLE book
(
	bookId int PRIMARY KEY,
	Bname char(30) NOT NULL,
	Press char(30),
	price float(2),
	Pdate date
);

/*创建课程-教材选择表*/
CREATE TABLE bookChoose
(
	courseId int,
	bookId int,
	number int,
	PRIMARY KEY(courseId,bookId),
	FOREIGN KEY(courseId) REFERENCES course(courseId),
	FOREIGN KEY(bookId) REFERENCES book(bookId)
);

/*创建教室信息表*/
CREATE TABLE classroom
(
	roomId int PRIMARY KEY,
	roomLocation char(10) NOT NULL,
	contain int
);

/*创建课程安排表*/
CREATE TABLE courseNew
(
	courseId int FOREIGN KEY(courseId) REFERENCES course(courseId),
	teacherId int FOREIGN KEY(teacherId) REFERENCES teacher(teacherId),
	roomId int FOREIGN KEY(roomId) REFERENCES classroom(roomId),
	PRIMARY KEY(courseId,teacherId,roomId)
);
