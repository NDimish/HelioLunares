from django.urls import path
from ticketing_api import views

urlpatterns = [
    path('users/', views.user_list,),
    path('users2/<int:pk>/', views.user_detail),
    path('users/<str:filter>/<int:pk>/', views.userData.as_view()),
]