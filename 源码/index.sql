use "qiuhuan_3117004993";

create UNIQUE index stu on SG(studentId, courseId);

create CLUSTERED index num on bookChoose(number);
 
drop index num on bookChoose;