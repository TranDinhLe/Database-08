use STUDENT_CARE;
create index courseLevel on course (Level);
create index job on employee (Job);

show index from student_care.course;
show index from student_care.employee;
