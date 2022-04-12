from django.urls import path
from .views import *

urlpatterns = [
    path('hello/', helloAPI),
    path('users/', getAllUsers)
]