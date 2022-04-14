from django.urls import path
from .views import *

urlpatterns = [
    path('getUserHistoryAPI', getUserHistories(request, "강시운"))
]