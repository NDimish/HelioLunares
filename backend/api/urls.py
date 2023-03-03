from django.urls import path
from api import views

urlpatterns = [
    path('users/', views.user_list,),
    path('users2/<int:pk>/', views.user_detail),
    path('users/<str:filter>/<int:pk>/', views.userData.as_view()),
    path('events/<str:filter>/<int:pk>/', views.EventData.as_view()),
]