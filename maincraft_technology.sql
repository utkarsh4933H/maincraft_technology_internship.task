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

--show all student details 	  
select * from students

--Average score in each subject
select avg(mathscore)as mathsavg, avg(sciencescore) as scienceavg,avg(englishscore) as englishavg
from students

--Top performer (highest total marks)
select name,(mathscore+sciencescore+englishscore) as total_score from students
order by total_score desc
limit 1 ;

--count students per grade
select count(name),grade from students
group by grade

--average score by gender
select avg(mathscore) as avgmaths,avg(sciencescore) as avgscience,avg(englishscore) as avgenglish,
gender from students
group by gender

--students with math>80
select Name from students
where mathscore>80;

--Update a student's grade.
Update students
set grade ='B+'
where studentid = 3;