from django.db import models
from sys import stdin

# Create your models here.
class User(models.Model):
    id = models.IntegerField(primary_key = True)
    name = models.CharField(max_length = 20)
    contact = models.CharField(max_length = 20)
    dept = models.CharField(max_length = 20)

class History(models.Model):
    id = models.AutoField(primary_key = True)
    userId = models.ForeignKey("User", db_column = "userId", on_delete = models.CASCADE)
    clubName = models.ForeignKey("Club", db_column = "clubName", on_delete = models.CASCADE)
    period = models.IntegerField()
    position = models.CharField(max_length = 10, blank = True)

class Club(models.Model):
    name = models.CharField(max_length = 20, primary_key = True)
    media = models.CharField(max_length = 20, unique = True)
    dept = models.CharField(max_length = 20)