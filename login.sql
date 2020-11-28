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
                      
update events_event set event_name = 'departmental' where event_id between 15 and 23;

                 

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

insert into events_departmental values(19,201,'Tech-Hunt',50,'2021-03-24 11:00:00','Computer Department','ARE YOU THE NEXT GEEK SHERLOCK?','tech_hunt.jpg');

insert into events_departmental values(20,201,'White Collar',50,'2021-03-24 12:00:00','Computer Department','BE SMART! BE INTERVIEW READY!','white_collar.jpg');

insert into events_departmental values(21,201,'Lekh Yaag',50,'2021-03-24 01:00:00','Computer Department','Blog Writing Competition','lekh_yaag.png');

insert into events_departmental values(22,201,'Genesis',50,'2021-03-24 02:00:00','Computer Department','EMPOWERED BY INNOVATION ','genesis.jpg');

insert into events_departmental values(23,201,'Workshop on AR and VR',50,'2021-03-24 04:00:00','Computer Department',' SEE UNREAL THINGS HAPPEN!','ar_vr.jpg');


insert into Participates values(1,10);
select * from Dept;
select * from Departmental;
select * from Participates;
select * from events_sports;
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

