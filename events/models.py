from django.db import models

# Create your models here.
class Student(models.Model):
    student_id = models.AutoField(primary_key=True)
    first_name = models.TextField(max_length=50)
    last_name = models.TextField(max_length=50)
    email_id = models.EmailField(max_length=50)
    branch = models.TextField(max_length=30)
    year = models.IntegerField()

    def _str_(self):
        return self.student_id
	
class Cultural(models.Model):
    event_id = models.IntegerField(primary_key = True)
    culture_name = models.TextField(max_length = 50)
    r_fees = models.FloatField()
    date_of_event = models.DateTimeField()
    venue = models.TextField(max_length = 50)
    details = models.TextField(max_length = 100)
    event_poster = models.TextField(max_length = 50)

class event(models.Model):
    event_id  = models.AutoField(primary_key = True) 

class Sports(models.Model):
    event_id = models.IntegerField(primary_key = True)
    sports_name = models.TextField(max_length = 50)
    r_fees = models.FloatField()
    date_of_event = models.DateTimeField()
    venue = models.TextField(max_length = 50)
    details = models.TextField(max_length = 100)
    event_poster = models.TextField(max_length = 50)

class Dept(models.Model):
    dept_id = models.IntegerField(primary_key=True)
    dept_name = models.TextField(max_length = 20)
    dept_event_name = models.TextField(max_length = 20) 
    event_poster = models.TextField(max_length = 20)  

class Departmental(models.Model):
    event_id = models.IntegerField(primary_key=True)
    dept_id = models.IntegerField()
    subevent_name = models.TextField(max_length=50)
    r_fees = models.FloatField()
    date_of_event = models.DateTimeField()
    venue = models.TextField(max_length = 50)
    details = models.TextField(max_length = 50)
    event_poster = models.TextField(max_length = 20) 

       

