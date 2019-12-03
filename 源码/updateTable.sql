use "qiuhuan_3117004993";

alter table student
add Sclass int;

alter table student
add Saddress char(10);

alter table book alter column Press char(30) not null;
--if (sql_variant_property(contain,'BaseType') from classroom) = 'int'

alter table classroom alter COLUMN contain char(10);

alter table SG drop constraint ck;
alter table SG add Constraint CK check(Grade between 0 and 150);