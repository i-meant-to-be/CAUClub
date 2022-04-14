from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.shortcuts import render
from django.http import HttpResponse
from .serializers import *
from .models import *
import random

# Create your views here.
@api_view(['GET'])
def getUser(request, targetUserName):
    targetUserData = User.objects.filter(name = targetUserName)
    serializer = UserSerializer(targetUserData)
    return Response(serializer.data)

@api_view(['GET'])
def getUserHistories(request, targetUserName):
    targetUserId = User.objects.filter(name = targetUserName).first.value_from_object()
    targetHistoriesData = History.objects.filter(userId = targetUserId)
    serializer = HistorySerializer(targetHistoriesData)
    return Response(serializer.data)

@api_view(['GET'])
def getClub(request, targetClubName):
    targetClubData = Club.objects.filter()