from django.urls import path
from api import views

urlpatterns = [
    path('usersadd/', views.userData.as_view()),
    path('eventadd/', views.EventData.as_view()),
]