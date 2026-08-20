-- We have a student table that also stores the Course_id of a student's favorite course. Our task has two parts related to using a SELF JOIN:

--     Find pairs of students that belong to the same department.
--     Identify students who have chosen the same Course_id as their favorite. Display the St_id, St_Name, and Course_id and order it in increasing Course_id.

select s1.st_id,s1.st_name,s1.department,s2.st_id,s2.st_name,s2.department
from student s1
join student s2
on s1.department=s2.department
and s1.st_id<>s2.st_id;

select distinct s1.st_id,s1.st_name,s1.course_id
from student s1
join student s2
on s1.course_id=s2.course_id
and s1.st_id<>s2.st_id
order by s1.course_id;
