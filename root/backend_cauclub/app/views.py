from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import viewsets
from django.core.mail import EmailMessage
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .serializers import *
from .models import *
import random

class MasterViewSet(viewsets.ViewSet):
    # TODO
    pass

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()

    # 모든 사용자 반환
    def list(self, request):
        serializer = UserSerializer(self.queryset, many = True)
        return Response(serializer.data)
    
    # id = pk인 사용자 반환
    def get(self, request, pk = None):
        user = get_object_or_404(self.queryset, id = pk)
        serializer = UserSerializer(user)
        return Response(serializer.data)

class HistoryViewSet(viewsets.ModelViewSet):
    queryset = History.objects.all()

    # id = pk인 사용자의 모든 활동 이력 반환
    def get(self, request, pk = None):
        histories = History.objects.filter(userId = pk)
        serializer = HistorySerializer(histories, many = True)
        return Response(serializer.data)

class ClubViewSet(viewsets.ModelViewSet):
    queryset = Club.objects.all()

    # name = pk인 동아리 반환
    def get(self, request, pk = None):
        club = get_object_or_404(self.queryset, name = pk)
        serializer = ClubSerializer(club)
        return Response(serializer.data)