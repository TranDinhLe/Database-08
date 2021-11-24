use STUDENT_CARE;

create table `users` (
  `user_id` int(11) not null,
  `unique_id` int(255) not null,
  `fullname` varchar(255) not null,
  `email` varchar(255) not null,
  `password` varchar(255) not null,
  `img` varchar(255) not null,
  `status` varchar(255) not null
) engine=InnoDB default charset=utf8mb4;
alter table `users`
  add primary key (`user_id`);

create user customer@localhost identified by '555555';
create user student@localhost identified by '123456';
create user teacher@localhost identified by '111111';
create user stdcare@localhost identified by '222222';
create user bra_mng@localhost identified by '333333';
create user cou_mng@localhost identified by '444444';
create user admin0@localhost identified by '654321';

grant all privileges on student_care.* to admin0@localhost;

#customer
grant insert on student_care.users to customer@localhost;
grant insert on student_care.student to customer@localhost;
grant insert, update on student_care.student_from_18 to customer@localhost;
grant insert on student_care.student_under_18 to customer@localhost;
grant select on student_care.course to customer@localhost;
grant select on student_care.teach to customer@localhost;

#student
grant select on student_care.* to student@localhost;
grant update on student_care.users to student@localhost;
grant update on student_care.student to student@localhost;
grant update on student_care.student_from_18 to student@localhost;
grant insert on student_care.contactrecordoffrom18student to student@localhost;
grant insert on student_care.contactrecordofunder18student to student@localhost;
grant insert, update, delete on student_care.ratecourse to student@localhost;
grant insert, update, delete on student_care.rateteacher to student@localhost;
grant insert, update, delete on student_care.learn to student@localhost;
grant insert, update, delete on student_care.guardian to student@localhost;

#teacher
grant select on student_care.* to teacher@localhost;
grant update on student_care.users to teacher@localhost;
grant update on student_care.employee to teacher@localhost;
grant insert, update, delete on student_care.studentresult to teacher@localhost;
grant insert, update, delete on student_care.learningdate to teacher@localhost;
grant insert, update, delete on student_care.teach to teacher@localhost;

#student care employee
grant select on student_care.* to stdcare@localhost;
grant update on student_care.users to stdcare@localhost;
grant update on student_care.employee to stdcare@localhost;
grant insert on student_care.contactrecordoffrom18student to stdcare@localhost;
grant insert on student_care.contactrecordofunder18student to stdcare@localhost;
grant insert, update, delete on student_care.request to stdcare@localhost;
grant insert, update, delete on student_care.receive to stdcare@localhost;

#course manager 
grant select on student_care.* to cou_mng@localhost;
grant update on student_care.users to cou_mng@localhost;
grant update on student_care.employee to cou_mng@localhost;
grant insert, update, delete on student_care.course to cou_mng@localhost;
grant insert, update, delete on student_care.takeplacein to cou_mng@localhost;
grant insert, update, delete on student_care.teach to cou_mng@localhost;

#branch manager
grant select on student_care.* to bra_mng@localhost;
grant update, delete on student_care.users to bra_mng@localhost;
grant delete on student_care.student to bra_mng@localhost;
grant insert, update, delete on student_care.employee to bra_mng@localhost;
grant insert, update, delete on student_care.student_care to bra_mng@localhost;
grant insert, update, delete on student_care.teacher to bra_mng@localhost;
grant insert, update, delete on student_care.manager to bra_mng@localhost;
grant insert, update, delete on student_care.branch to bra_mng@localhost;

flush privileges;

create index courseLevel on course (Level);
create index job on employee (Job);

show index from student_care.course;
show index from student_care.employee;