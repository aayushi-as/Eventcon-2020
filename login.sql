create database login;
use login;
create table Student(student_id int primary key auto_increment,first_name varchar(50),last_name varchar(50),email_id varchar(50),password varchar(50),branch varchar(30),year date);
drop table Student;
create table Event(event_id int primary key auto_increment,event_name varchar(50),R_fees float4,dates DATETIME,venue varchar(50),details varchar(40),time DATETIME);
drop table Event;
create table Participates(student_id int,
                          event_id int,
                          event_name varchar(50),
                          
                          foreign key(student_id) references Student(student_id),
                          foreign key(event_id) references Event(event_id)
                          );
                          
create table Admin(admin_id int primary key auto_increment,
                   admin_name varchar(50),
                   email_id varchar(50),
                   password varchar(50),
                   admin_keys varchar(20),
                   event_id int,
                   foreign key(event_id) references Event(event_id));  
                   
create table Sponser(sponser_id int primary key auto_increment,
                     sponsorer_name varchar(50));
                     
create table Departmental(dept_event_id int primary key,
                          dept_name varchar(50),
                          event_name varchar(50),
                          event_id int,
                          foreign key(event_id) references Event(event_id));
                          
create table Cultural(cultural_id int primary key auto_increment,
                      culture_name varchar(50),
		              event_id int,
                      foreign key(event_id) references Event(event_id));  
                      
 create table Organized_by(sponser_id int primary key,
                          event_id int,
                          foreign key(sponser_id) references Sponser(sponser_id),foreign key(event_id) references event(event_id));                    
                   

