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
	
