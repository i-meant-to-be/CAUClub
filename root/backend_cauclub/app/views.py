from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import render
from django.http import HttpResponse
from .serializers import UserSerializer
from .models import User
import random

# Create your views here.
@api_view(['GET'])
def helloAPI(request):
    return Response("Hello, World!")

@api_view(['GET'])
def getAllUsers(request):
    users = User.objects.all()
    serializer = UserSerializer(users, many = True)
    return Response(serializer.data)