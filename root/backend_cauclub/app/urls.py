from rest_framework import routers
from django.urls import include, path
from .views import *

urlpatterns = [
    path('user', UserViewSet.as_view({'get': 'list'})),
    path('user/<int:pk>', UserViewSet.as_view({'get': 'get'})),

    path('club/<str:pk>', ClubViewSet.as_view({'get': 'get'})),

    path('user/<int:pk>/history', HistoryViewSet.as_view({'get': 'get'})),
]