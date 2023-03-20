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

from django.conf import settings
from django.conf.urls.static import static

from api import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('homepage/', views.homePage, name='homepage'),

    path('log_in/', views.LogInView.as_view(), name='log_in'),
    path('log_out/', views.log_out, name='log_out'),
    
    path('users/', views.UsersListView.as_view(), name="users_list"),
    path('users/<int:pk>/', views.UserView.as_view(), name="user_with_id"),
    
    path('people/', views.PeopleListView.as_view(), name="people_list"),
    path('people/<int:pk>/', views.PeopleView.as_view(), name="people_with_id"),

    path('society/', views.SocietyListView.as_view(), name="society_list"),
    path('society/<int:pk>/', views.SocietyView.as_view(), name="society_with_id"),

    path('event/', views.EventApiView.as_view(), name="event"),
    path('event/<int:pk>/', views.EventApiInfoView.as_view(), name="event_info"),
   
    path('university/', views.UniversityApiView.as_view(), name="university"),

    path('university/<str:pk>/', views.UniversityInfoApiView.as_view(), name="university_info"),

    path('societyrole/', views.PeopleRoleAtSocietyView.as_view(), name="society_role"),
    path('societyrole/update/', views.society_update_user),
    path('societyrole/remove/',views.society_remove_user),
    path('societyrole/join/',views.society_join),

    path("ticket/", views.TicketApiView.as_view(), name="ticket"),
    path("ticket/<int:pk>/", views.TicketInfoApiView.as_view(), name="ticket_info"),

    path("event_categories_type/", views.EventCategoriesTypeApiView.as_view(), name="event_categories_type"),
    path("event_categories_type/<int:pk>/", views.EventCategoriesTypeInfoApiView.as_view(),
         name="event_categories_type_info"),

    path("event_categories/", views.EventCategoriesApiView.as_view(), name="event_categories"),
    path("event_categories/<int:pk>", views.EventCategoriesInfoApiView.as_view(),
         name="event_categories_info"),

    path("society_categories_type/", views.SocietyCategoriesTypeApiView.as_view(), name="society_categories_type"),
    path("society_categories_type/<int:pk>/", views.SocietyCategoriesTypeInfoApiView.as_view(),
         name="society_categories_type_info"),

    path("society_categories/", views.SocietyCategoriesApiView.as_view(), name="society_categories"),
    path("society_categories/<int:pk>/", views.SocietyCategoriesInfoApiView.as_view(),
         name="society_categories_info"),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

