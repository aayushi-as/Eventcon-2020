create database login;
use login;
show tables;
create table events_student(student_id int primary key auto_increment,
                     first_name varchar(50),
                     last_name varchar(50),
                     email_id varchar(50),
                     branch varchar(30),
                     year int);
drop table events_student;
drop table events_event;
drop table Participates;
drop table sponser;
drop table events_dept;
drop table events_departmental;
drop table events_cultural;
drop table Organized_by;	
drop table events_sports;
create table events_event(event_id int primary key auto_increment);
alter table events_event add column event_name varchar(30);
drop table Event;
create table Participates(student_id int,
                          event_id int ,
                          primary key(student_id,event_id),
                          foreign key(student_id) references events_student(student_id) on delete cascade,
                          foreign key(event_id) references events_event(event_id) on delete cascade
                          );
                          
create table Admin(admin_id int primary key auto_increment,
                   admin_name varchar(50),
                   email_id varchar(50),
                   password varchar(50),
                   admin_keys varchar(20),
                   event_id int,
                   foreign key(event_id) references Event(event_id));  
                   
create table events_dept(dept_id int primary key,
                        dept_name varchar(20),
                        dept_event_name varchar(20),
                        event_poster varchar(20));
                     
create table events_departmental(event_id int,
						  dept_id int,
                          primary key(event_id,dept_id),
                          subevent_name varchar(50),
                          r_fees float4,
                          date_of_event datetime,
						  venue varchar(50),
                          details varchar(100),
                          event_poster varchar(20),
                          foreign key(event_id) references events_event(event_id) on delete cascade,
						  foreign key(dept_id) references events_dept(dept_id) on delete cascade);
                          
create table events_cultural(event_id int primary key,
                      culture_name varchar(50),
		              r_fees float4,
                      date_of_event datetime,
                      venue varchar(50),
                      details varchar(100),
                      event_poster varchar(50),
                      foreign key(event_id) references events_event(event_id) on delete cascade
                      );  
create table events_sports(event_id int primary key,
                      sports_name varchar(50),
		              r_fees float4,
                      date_of_event datetime,
                      venue varchar(50),
                      details varchar(100),
                      event_poster varchar(50),
                      foreign key(event_id) references events_event(event_id) on delete cascade
                      );                        
                      
update events_event set event_name = 'departmental' where event_id between 24 and 28;

                 

select * from events_event;
drop table events_student;

insert into events_event values(1);
insert into events_event values(2);
insert into events_event values(3);
insert into events_event values(4);
insert into events_event values(5);
insert into events_event values(6);
insert into events_event values(7);
insert into events_event values(8);
insert into events_event values(9);
insert into events_event values(10);
insert into events_event values(11);
insert into events_event values(12);
insert into events_event values(13);
insert into events_event values(14);
insert into events_event values(15);
insert into events_event values(16);
insert into events_event values(17);
insert into events_event values(18);
insert into events_event values(19);
insert into events_event values(20);
insert into events_event values(21);
insert into events_event values(22);
insert into events_event values(23);
insert into events_event values(24);
insert into events_event values(25);
insert into events_event values(26);
insert into events_event values(27);
insert into events_event values(28);
insert into events_event values(29,'departmental');
insert into events_event values(30,'departmental');
insert into events_event values(31,'departmental');
insert into events_event values(32,'departmental');
insert into events_event values(33,'departmental');
insert into events_event values(34,'departmental');
insert into events_event values(35,'departmental');
insert into events_event values(36,'departmental');
insert into events_event values(37,'departmental');
insert into events_event values(38,'departmental');
insert into events_event values(39,'departmental');
insert into events_event values(40,'departmental');
insert into events_event values(41,'departmental');
insert into events_event values(42,'departmental');
insert into events_event values(43,'departmental');
insert into events_event values(44,'departmental');
insert into events_event values(45,'departmental');
insert into events_event values(46,'departmental');
insert into events_event values(47,'departmental');
insert into events_event values(48,'departmental');
insert into events_event values(49,'departmental');
insert into events_event values(50,'departmental');
insert into events_event values(51,'departmental');
insert into events_event values(52,'departmental');
insert into events_event values(53,'departmental');
insert into events_event values(54,'departmental');
insert into events_event values(55,'departmental');
insert into events_event values(56,'departmental');
insert into events_event values(57,'departmental');
insert into events_event values(58,'departmental');
insert into events_event values(59,'departmental');
insert into events_event values(60,'departmental');

insert into events_cultural values(1,'Rangoli Competition',50,'2020-12-30 14:02:02','Ground Floor,Mechanical Dept,KKWIEER','Inaugration of Maffick by this competition','rangoli.jpg');
insert into events_cultural values(2,'Poster Competition',50,'2020-12-30 15:02:02','In front of Central Library','Student Co-ordinators:1.Parijat Yeole,2.Vedant Deshmukh','poster.jpg');
insert into events_cultural values(3,'Soft Skills',70,'2020-12-30 11:00:00','Audio Video Hall,E&TC Dept,KKWIEER','Elocution & Quiz,Debate & Sell it','elocution.jpg');
insert into events_cultural values(4,'Nakshatrache Dene',150,'2020-12-30 16:00:00','PC Ray Hall Chemical Dept,KKWIEER','Marathi Songs','naksh.jpeg');
insert into events_cultural values(5,'Sketching and Drawing',40,'2020-12-30 17:00:00','Checmical Dept,KKWIEER','Student Co-ordinators:1.Sanket Pawar,2.Tejas Patil','sketch.jpg');
insert into events_cultural values(6,'Personality Contest',60,'2020-12-31 11:00:00','Pendol(on playground),KKWIEER','Student Co-ordinators:1.Jayesh Mahakal,2.Mitesh Patil','personality.jpg');
insert into events_cultural values(7,'Fashion Show',70,'2020-12-31 18:00:00','Pendol(on playground),KKWIEER','Student Co-ordinators:1.Shubham Pawar,2.Vinay Kannor','fashion.jpg');

insert into events_sports values(8,'Chess',10,'2020-12-27 10:00:00','Gymkhana,KKWIEER','Student Co-ordinators:1.Anand Pathak,2.Omkar Beri','chess.jpg');
insert into events_sports values(9,'Badminton',25,'2020-12-27 12:00:00','Ground,KKWIEER','Student Co-ordinators:1.Parijat Yeole 2.Vedant Deshmukh','badminton.jpg');
insert into events_sports values(10,'Carrom',15,'2020-12-27 01:00:00','Gymkhana,KKWIEER','Student Co-ordinators:1.Ankita Shahne ,2.Viraj Mutha','carrom.jpg');
insert into events_sports values(11,'Cricket',30,'2020-12-27 03:00:00','Ground,KKWIEER','Student Co-ordinators:1.Harshad Raut 2.Yash Avhad','cricket.jpg');
insert into events_sports values(12,'Football',30,'2020-12-27 04:00:00','Ground,KKWIEER','Student Co-ordinators:1.sanket Pawar 2.Tejas Patil','football.jpg');
insert into events_sports values(13,'Table Tennis',30,'2020-12-27 05:00:00','Ground,KKWIEER','Student Co-ordinators:1.Jayesh Mahakal  2.Mitesh Patil','tennis.jpg');
insert into events_sports values(14,'Basketball',30,'2020-12-27 06:00:00','Court,KKWIEER','Student Co-ordinators:1.Shubham Pawar 2.Vinnay Kannor','basketball.jpg');

insert into events_dept values(201,'Computer','Equinox','Equinox.jpg');
insert into events_dept values(202,'Production','Invasion','Invasion.jpg');
insert into events_dept values(203,'E&TC','Telekinesis','Telekinesis.jpg');
insert into events_dept values(204,'Civil','Force','force.jpg');
insert into events_dept values(205,'Chemical','Chemfest','Chemfest.jpg');
insert into events_dept values(206,'Mechanical','Mecheaven','Meacheaven.jpg');
insert into events_dept values(207,'IT','Itiazaa','nature.jpeg');
insert into events_dept values(208,'Electrical','IET Expo','IET.jpg');

insert into Participates values(1,10);
insert into Participates values(3,12);
insert into Participates values(3,7);
insert into Participates values(3,8);
insert into Participates values(3,20);
insert into Participates values(3,14);
insert into Participates values(3,22);
insert into Participates values(3,5);
insert into Participates values(3,21);
insert into Participates values(3,4);
insert into Participates values(3,1);

insert into Participates values(2,10);
insert into Participates values(2,15);
insert into Participates values(2,2);

describe events_cultural;
select * from events_event;
select * from events_cultural;
select * from events_sports;
select * from events_dept;
select * from events_departmental;
select * from auth_user;
select * from events_student;
select * from Participates;


delete from auth_user where id = 7;
delete from event where event_id = 1;
select * from events_event;
alter table events_cultural add column event_poster varchar(50);
update events_cultural set event_poster = 'rangoli.jpg' where event_id = 1;
update events_cultural set event_poster = 'poster.jpg' where event_id = 2;


insert into Dept values(201,'Computer','Equinox');
insert into Dept values(202,'Chemical','Chemfest');

insert into events_departmental values(15,201,'Source Code',50,'2021-03-23 10:00:00','Computer Department','TALK IS CHEAP! SHOW ME THE CODE','source_code.jpg');
delete from events_departmental where event_id = 15;

insert into events_departmental values(16,201,'Insync',50,'2021-03-23 11:00:00','Computer Department','WRITE INSIDE OUT.GIVE PEOPLE SOMETHING TO THINK ABOUT','insync.jpg');

insert into events_departmental values(17,201,'Shutterbug',50,'2021-03-23 11:00:00','Computer Department','CHANGE THE LENS, CHANGE THE STORY','shutterbug.jpg');

insert into events_departmental values(18,201,'Hackathon',50,'2021-03-23 12:00:00','Computer Department','OUTWITH.OUTPLAY.OUTLAST.ARE YOU NEXT GEEK SHERLOCK','hackathon.jpg');

insert into events_departmental values(19,201,'Tech-Hunt',50,'2021-03-24 11:00:00','Computer Department','ARE YOU THE NEXT GEEK SHERLOCKs?','tech_hunt.jpg');

insert into events_departmental values(20,201,'White Collar',50,'2021-03-24 12:00:00','Computer Department','BE SMART! BE INTERVIEW READY!','white_collar.jpg');

insert into events_departmental values(21,201,'Lekh Yaag',50,'2021-03-24 01:00:00','Computer Department','Blog Writing Competition','lekh_yaag.png');

insert into events_departmental values(22,201,'Genesis',50,'2021-03-24 02:00:00','Computer Department','EMPOWERED BY INNOVATION ','genesis.jpg');

insert into events_departmental values(23,201,'Workshop on AR and VR',50,'2021-03-24 04:00:00','Computer Department',' SEE UNREAL THINGS HAPPEN!','ar_vr.jpg');
insert into events_departmental values(24,205,'Salt Act',50,'2021-03-22 10:00:00','Chemical Department','To be experimental...','salt_act.png');

insert into events_departmental values(25,205,'Placement Bizzare',50,'2021-03-22 11:00:00','Chemical Department','Simulating Recruitment...','bizzare.png');
insert into events_departmental values(26,205,'Tech Paper',50,'2021-03-22 12:00:00','Chemical Department','Let your words radiate insight','tech_paper.png');
delete from events_departmental where event_id = 26;
insert into events_departmental values(27,205,'Gol Gappa Race',50,'2021-03-22 01:00:00','Chemical Department','Wana Chaat?Gimme a Lift','gol_gappa.png');
insert into events_departmental values(28,205,'Chem O Race',50,'2021-03-22 02:00:00','Chemical Department','How strong is your Chemistry?','chem_o_race.png');


insert into events_departmental values(29,204,'Bridge O Mania',50,'2021-03-21 10:00:00','Civil Department','National Level Event Competition','bridge_o_mania.png');

insert into events_departmental values(30,204,'Tower Power',50,'2021-03-21 11:00:00','Civil Department','Build with us','tower_power.png');

insert into events_departmental values(31,204,'Poster Making',50,'2021-03-21 12:00:00','Civil Department','Show your creativity','poster.jpg');

insert into events_departmental values(32,204,'Snap Hunt',50,'2021-03-21 01:00:00','Civil Department','Photography Hunt','snap_hunt.png');

insert into events_departmental values(33,204,'Cad Enza',50,'2021-03-21 02:00:00','Civil Department','Show your software skills','cad_enza.png');

insert into events_departmental values(34,204,'Quiz',50,'2021-03-21 03:00:00','Civil Department','Can you crack it?','quiz.png');

insert into events_departmental values(35,204,'Drama',50,'2021-03-21 10:00:00','Civil Department','Acting Talent','drama.png');

insert into events_departmental values(36,204,'Fancy Bouyancy',50,'2021-03-21 04:00:00','Civil Department','How good are your basics?','fancy_bouyancy.png');

insert into events_departmental values(37,206,'Art Motion',50,'2021-03-22 10:00:00','Mechanical Department','Dare to play with mechanism','art_motion.png');
insert into events_departmental values(38,206,'Black Tye',50,'2021-03-22 11:00:00','Mechanical Department','Be Ready,Be Smart,Be Noticed','black_tye.png');
insert into events_departmental values(39,206,'Box Cricket',50,'2021-03-22 12:00:00','Mechanical Department','Enleash your cricket skills','box_cricket.png');
insert into events_departmental values(40,206,'Foos Ball',50,'2021-03-22 01:00:00','Mechanical Department','Winning is not everything!','foos_ball.png');
insert into events_departmental values(41,206,'Gamers Arena',50,'2021-03-22 02:00:00','Mechanical Department','Stay Low,Move Fast,One shot,One kill','gamers_arena.png');
insert into events_departmental values(42,206,'Hopipola',50,'2021-03-22 03:00:00','Mechanical Department','With new twist and new theme of Pubg','hoppipola.png');
insert into events_departmental values(43,206,'Lathe War',50,'2021-03-22 04:00:00','Mechanical Department','Be Ready!','lathe_war.png');
insert into events_departmental values(44,206,'Lazer Maze',50,'2021-03-22 10:00:00','Mechanical Department','Participate and Win','lazer_maze.png');
insert into events_departmental values(45,206,'Picturesque',50,'2021-03-23 10:00:00','Mechanical Department','An upshot of light and time','picturesque.png');
insert into events_departmental values(46,206,'Robo Race',50,'2021-03-22 11:00:00','Mechanical Department','Think about the end of the race','robo_race.png');
insert into events_departmental values(47,206,'Treasure Hunt',50,'2021-03-22 10:00:00','Mechanical Department','Chase The Flame','treasure_hunt.png');

insert into events_departmental values(48,207,'Snakes And Ladders',50,'2021-03-22 10:00:00','IT Department','Not on board but on ground','snake.png');
insert into events_departmental values(49,207,'Attractive Photo',50,'2021-03-22 11:00:00','IT Department','Unofficial Instagram Contest','attract_photo.png');
insert into events_departmental values(50,207,'FIFA',50,'2021-03-22 12:00:00','IT Department','Feel the game','fifa.png');
insert into events_departmental values(51,207,'Foldoscope',50,'2021-03-22 01:00:00','IT Department','Origami Based Optical Microscope','foldoscope.png');

insert into events_departmental values(52,202,'Logo Quiz',50,'2021-03-25 10:00:00','Production Department','We came,we quizzed,we conquered','logo_quiz.png');
insert into events_departmental values(53,202,'Maniac',50,'2021-03-25 11:00:00','Production Department','Conquer the territory','maniac.png');
insert into events_departmental values(54,202,'PPT Competition',50,'2021-03-25 12:00:00','Production Department','Combine innovative ideas','ppt_comp.png');
insert into events_departmental values(55,202,'Save the Eggstronaut',50,'2021-03-25 01:00:00','Production Department','Save your egg and become eggstonaut','save.png');
insert into events_departmental values(56,202,'Snookball',50,'2021-03-25 02:00:00','Production Department','Play to win','snookball.png');

insert into events_departmental values(57,203,'Make your Quibbler',50,'2021-03-25 10:00:00','ENTC Department','Poster Competition','poster.jpg');
insert into events_departmental values(58,203,'Show your Patronous',50,'2021-03-25 11:00:00','ENTC Department','Photography Competition','lens.jpg');
insert into events_departmental values(59,203,'Brew your Potion',50,'2021-03-25 12:00:00','ENTC Department','Project Competition','board.jpg');
insert into events_departmental values(60,203,'Crack the Owls',50,'2021-03-25 01:00:00','ENTC Department','Coding Competition','source_code.jpg');





delete from events_departmental where event_id = 52;
select * from events_departmental where event_id = 37;
insert into Participates values(1,10);
select subevent_name,r_fees,date_of_event,venue,details,event_poster from events_departmental where dept_id = 201;
select * from Dept;
select * from Departmental;
select * from Participates;
select * from events_sports;
select * from events_event;
select * from events_student;
select * from student_audit;
select * from auth_user;
delete from events_event where event_id=15;

select Participates.event_id, event_name
from Participates
join events_event
on Participates.event_id = events_event.event_id
where student_id = 3;

select sports_name, venue, date_of_event from events_sports
where event_id = 8;

select subevent_name, venue, date_of_event
from events_departmental
where event_id = 20;

SELECT event_id FROM Participates WHERE student_id = 3;
SELECT Participates.event_id, event_name 
                        FROM Participates 
                        JOIN events_event 
                        ON Participates.event_id = events_event.event_id 
                        WHERE student_id = 3;
use login;                        
create table student_audit(
action varchar(20) not null,
student_id int,
first_name varchar(50),
last_name varchar(50),
email_id varchar(50),
branch varchar(30),
year int,
changed_date date);
drop trigger after_update;
drop table student_audit;

create table event_audit(
action varchar(20) not null,
student_id int,
event_id int ,
participate_date date);
              
              drop table event_audit;
CREATE TRIGGER after_update AFTER UPDATE ON events_student 
FOR EACH ROW
INSERT INTO student_audit
SET action = 'UPDATE',
student_id = OLD.student_id,
first_name = OLD.first_name,
last_name = OLD.last_name,
email_id = OLD.email_id,
branch = OLD.branch,
year = OLD.year,
changed_date = NOW();
drop table event_audit;
CREATE TRIGGER after_register AFTER INSERT ON Participates
FOR EACH ROW
INSERT INTO event_audit values('Registered',new.student_id,
new.event_id,NOW());


drop trigger after_register;



select * from event_audit;
update events_student set first_name = 'Aisha' where student_id = 1;