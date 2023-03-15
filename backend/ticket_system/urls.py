"""ticket_system URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include


from api import views

urlpatterns = [
    path('admin/', admin.site.urls),

    path('log_in/', views.LogInView.as_view(), name='log_in'),
    path('log_out/', views.log_out, name='log_out'),
    
    path('users/', views.UsersListView.as_view(), name="users_list"),
    path('users/<int:pk>/', views.UserView.as_view(), name="user_with_id"),
    
    path('society/', views.SocietyListView.as_view(), name="society_list"),
    path('society/<int:pk>/', views.SocietyView.as_view(), name="society_with_id"),

   # event router

    path('event/', views.EventApiView.as_view(), name="event"),
    path('event/<int:pk>/', views.EventApiInfoView.as_view(), name="event_info"),
    # path('event_list/', views.get_event_list, name="event_with_id"),
    # path('add_event/', views.add_event, name="add_event"),
    # path('event/<int:pk>/', views.get_event_with_id, name="event_list"),
    # path('modify_event/<int:pk>/', views.modify_event, name="modify_event"),
    # path('delete_event/<int:pk>/', views.delete_event, name="delete_event"),

    path('university/', views.UniversityApiView.as_view(), name="university"),
    path('university/<str:pk>/', views.UniversityInfoApiView.as_view(), name="university_info"),
    # path('university_list/', views.get_university_list, name="university_list"),
    # path('university/<int:pk>/', views.get_university_with_id, name="university_with_id"),
    # path('modify_university/<int:pk>/', views.modify_university, name="modify_university"),
    # path('delete_university/<int:pk>/', views.delete_university, name="delete_university"),

    # path("buys/", views.BuysApiView.as_view(), name="buys"),
    # path("buys/<int:pk>", views.BuysApiInfoView.as_view(), name="buys_info"),
    #
    # path("hosts/", views.HostsApiView.as_view(), name="hosts"),
    # path("hosts/<int:pk>", views.HostsInfoApiView.as_view(), name="hosts_info"),

    path("ticket/", views.TicketApiView.as_view(), name="ticket"),
    path("ticket/<int:pk>", views.TicketInfoApiView.as_view(), name="ticket_info"),

    path("event_categories_type/", views.EventCategoriesTypeApiView.as_view(), name="event_categories_type"),
    path("event_categories_type/<int:pk>", views.EventCategoriesTypeInfoApiView.as_view(),
         name="event_categories_type_info"),

    path("event_categories/", views.EventCategoriesApiView.as_view(), name="event_categories"),
    path("event_categories/<int:pk>", views.EventCategoriesInfoApiView.as_view(),
         name="event_categories_info"),

    path("society_categories_type/", views.SocietyCategoriesTypeApiView.as_view(), name="society_categories_type"),
    path("society_categories_type/<int:pk>", views.SocietyCategoriesTypeInfoApiView.as_view(),
         name="society_categories_type_info"),

    path("society_categories/", views.SocietyCategoriesApiView.as_view(), name="society_categories"),
    path("society_categories/<int:pk>", views.SocietyCategoriesInfoApiView.as_view(),
         name="society_categories_info"),
]
