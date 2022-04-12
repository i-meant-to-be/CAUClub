from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length = 20)
    club = models.CharField(max_length = 20)
    studentNum = models.CharField(max_length = 10, primary_key = True)