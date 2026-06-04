create table students(
  StudentID SERIAL primary key,
  Name VARCHAR (50),
  Gender VARCHAR(10),
  Age int,
  Grade VARCHAR (10),
  MathScore int,
  ScienceScore int,
  EnglishScore int
);
insert into Students
(name,gender,age,grade,mathscore,sciencescore,englishscore)
values('utkarsh','male',19,'A+',99,99,99),
      ('avirat','male',19,'A+',98,89,90),
	  ('dev','male',19,'A+',94,99,98),
	  ('samarth','male',19,'A+',99,95,99),
	  ('shashank','male',19,'A+',95,92,93),
	  ('ikbal','male',19,'A+',98,97,96),
      ('preyrit','male',19,'A+',94,97,98),
	  ('ikbal','male',19,'A+',93,97,98),
	  ('gaurav','male',19,'A+',99,95,99),
	  ('ayush','male',19,'A+',95,92,93);


create table courses(
  ID int primary key ,
  name varchar (100)
);

create table enrollments(
  student_id int primary key,
  course_id int,
  grade int 
  );

insert into courses(id,name)
values (1 , 'SQL'),
      ( 2, 'Python'),
	  (3, 'powerBI');

insert into enrollments(student_id,course_id,grade)
values (1 , 1,85),
      ( 2, 3, 76),
	  (3, 2, 67),
	  (4,2,89);

select  s.studentid, s.name as student_name , c.name as course_name from students s 
join enrollments e on s.studentid = e.student_id
join courses c on e.course_id = c.id
order by c.name , s.name

select c.name as course_name,
       avg(e.grade) as avg_grade from courses c 
	   join enrollments e on c.id = e.student_id
	   group by c.name

select   s.studentid,s.name,avg(e.grade) as avg_grade from students s
join enrollments e on s.studentid = e.student_id
group by  s.studentid, s.name
ORDER BY avg_grade desc
limit 3;

select count(distinct student_id) as fail_student from enrollments
where grade < 40 ;