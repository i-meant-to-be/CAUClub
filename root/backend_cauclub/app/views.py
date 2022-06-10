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

    # 이 사용자가 DB에 존재함?
    def isExist(self, request):
        user

    # 모든 사용자 반환
    def list(self, request):
        serializer = UserSerializer(self.queryset, many = True)
        return Response(serializer.data)
    
    # id = pk인 사용자 반환
    def get(self, request, pk = None):
        user = get_object_or_404(self.queryset, id = pk)
        serializer = UserSerializer(user)
        return Response(serializer.data)

    # 이름 또는 학번 둘 중 하나는 맞는지, 아니면 둘 다 틀린지 확인하는 함수
    # Code: 0, 완전 일치 / 1, 둘 다 존재하나 매칭되지 않음 / 2, 이름만 존재 / 3, 학번만 존재 / 4, 둘 다 존재하지 않음
    def validate(self, request, pk = None):
        isIdExist = True
        isNameExist = True
        userId, userName = str(pk).split("_")
        #print(f"userName: {userName}, userId: {userId}")

        if not User.objects.filter(id__exact = userId): isIdExist = False
        if not User.objects.filter(name__exact = userName): isNameExist = False
        #print(f"id found? {not idCounter}, name found? {not nameCounter}")

        if not isIdExist and not isNameExist: returnCode = 4
        elif isIdExist and not isNameExist: returnCode = 3
        elif not isIdExist and isNameExist: returnCode = 2
        else:
            user = User.objects.filter(id__exact = userId).values()[0]
            if user["name"] == userName: returnCode = 0
            else: returnCode = 1

        return Response(data = returnCode, status = 200)

class HistoryViewSet(viewsets.ModelViewSet):
    queryset = History.objects.all()

    # id = pk인 사용자의 모든 활동 이력 반환
    def getJoinedClubs(self, request, pk = None):
        histories = History.objects.filter(userId = pk).values_list("clubName", flat = True)
        return Response(str(list(histories))[1:-1])

    def getHistories(self, request, pk = None):
        userId, clubName = str(pk).split("_")
        histories = History.objects.filter(userId = userId, clubName = clubName)
        serializer = HistorySerializer(histories, many = True)
        return Response(serializer.data)

class ClubViewSet(viewsets.ModelViewSet):
    queryset = Club.objects.all()

    # name = pk인 동아리 반환
    def get(self, request, pk = None):
        club = get_object_or_404(self.queryset, name = pk)
        serializer = ClubSerializer(club)
        return Response(serializer.data)