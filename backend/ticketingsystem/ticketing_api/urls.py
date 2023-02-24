from django.urls import path
from ticketing_api import views

urlpatterns = [
    path('users/', views.user_list,),
    path('users/<int:pk>/', views.user_detail),
    path('users2/', views.userData.as_view()),
]