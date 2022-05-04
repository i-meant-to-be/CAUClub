from rest_framework import routers
from django.urls import include, path
from .views import *

urlpatterns = [
    path('user', UserViewSet.as_view({'get': 'list'})),
    path('user/<int:pk>', UserViewSet.as_view({'get': 'get'})),
    path('user/validate/<str:pk>', UserViewSet.as_view({'get': 'validate'})),

    path('club/<str:pk>', ClubViewSet.as_view({'get': 'get'})),

    path('user/<int:pk>/getJoinedClubs', HistoryViewSet.as_view({'get': 'getJoinedClubs'})),
    path('user/issue/<str:pk>', HistoryViewSet.as_view({"get": "getHistories"}))
]