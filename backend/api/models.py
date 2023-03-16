import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import EmailValidator
from .managers import UserManager
from django.conf import settings

#Image functions

# Create your models here.
class University(models.Model):
    name = models.CharField(max_length=50, blank=False, unique=True)
    latitude = models.FloatField(max_length=10, blank=False, unique=False)
    longitude = models.FloatField(max_length=10, blank=False, unique=False)
    street_name = models.CharField(max_length=50, blank=False, unique=False)
    postcode = models.CharField(max_length=15, blank=False, unique=False)
    
class User(AbstractUser):
    username = None

    email = models.EmailField(unique=True, blank=False, validators=[EmailValidator()])
    date_joined = models.DateField(auto_now_add=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    USER_TYPE_CHOICES = (
        (1, 'nonstudent'),
        (2, 'student'),
        (3, 'society'),
    )

    user_level = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES, default=1)

    objects = UserManager()

    def __str__(self):
        return self.email


class People(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    university_studying_at = models.ForeignKey(University, on_delete=models.CASCADE)

    first_name = models.CharField(blank=False, unique=False, max_length=40)
    last_name = models.CharField(blank=False, unique=False, max_length=40)

    field_of_study = models.CharField(blank=False, unique=False, max_length=30)


class Society(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, blank=False)
    name = models.CharField(blank=False, unique=False, max_length=40)
    creation_date = models.DateField(blank=False)
    about_us = models.TextField(blank=True, null=True)
    # Add category stuff later

    university_society_is_at = models.ForeignKey(University, on_delete=models.CASCADE)
    join_date = models.DateField(auto_now_add=True)


    def upload_img(instance, filename):
        return "{0}/{1}".format(instance.user.id,filename)
    
    image = models.ImageField(upload_to = upload_img, blank=True, null=True)

    def join_soc(self, user: User, level=1):

        # Store this info in the StudentRoleAtSociety database.
        role_given = PeopleRoleAtSociety.objects.create(
            society=self,
            user_at_society=People.objects.get(user=user),
            role=level
        )
        role_given.full_clean()
        role_given.save()

    def update_student_role(self, user: User, level=1):
        # Retrieve the user from the societal roles db and delete them to avoid violating the unique constraint.
        role_given = PeopleRoleAtSociety.objects.get(
            society=self,
            user_at_society=People.objects.get(user=user)
        )

        role_given.level = level

        role_given.full_clean()
        role_given.save()

    def delete_student_role(self, user: User):
        role_given = PeopleRoleAtSociety.objects.get(
            society=self,
            user_at_society= People.objects.get(user=user)
        )
        role_given.delete()

class PeopleRoleAtSociety(models.Model):
    society = models.ForeignKey(Society, on_delete=models.CASCADE, blank=False)
    user_at_society = models.ForeignKey(People, on_delete=models.CASCADE, blank=False)

    SOCIETY_ROLE = (
        (1, 'member'),
        (2, 'admin'),
        (3, 'committee'),
    )

    role = models.PositiveSmallIntegerField(choices=SOCIETY_ROLE, default=1)

    # def __str__(self):
    #     str1 = self.society.name + " --- " + self.user_at_society.first_name + self.user_at_society.last_name + " --- "
    #     str2 = str(self.user_at_society.user.user_level)
    #     return str1 + str2


class Event(models.Model):
    society_id = models.ForeignKey(Society, on_delete=models.CASCADE, blank=False)
    duration = models.IntegerField(blank=False, unique=False)
    event_date = models.DateTimeField(blank=False)
    event_name = models.CharField(max_length=50, blank=False)
    location = models.CharField(max_length=50, blank=True)
    description = models.CharField(max_length=500, blank=True)
    price = models.FloatField(max_length=10, blank=False)
    update_time = models.DateTimeField(auto_now=datetime.datetime.now(), blank=False)
    create_time = models.DateTimeField(auto_now_add=datetime.datetime.now(), blank=False)
    attendance = models.IntegerField(blank=True, unique=False, default=0) # This will be manually entered by the user once an event has finished

    class Meta:
        verbose_name = "event"
        verbose_name_plural = verbose_name


class Ticket(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE, null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=False)
    date = models.DateTimeField(auto_now_add=datetime.datetime.now(), blank=False)
    price = models.FloatField(blank=False, default=0.0)


class EventCategoriesType(models.Model):
    category_name = models.CharField(max_length=200, null=False)


class EventCategories(models.Model):
    eventId = models.ForeignKey(Event, on_delete=models.CASCADE, null=False)
    categoryId = models.ForeignKey(EventCategoriesType, on_delete=models.CASCADE, null=False)


class SocietyCategoriesType(models.Model):
    category_name = models.CharField(max_length=200, null=False)


class SocietyCategories(models.Model):
    societyId = models.ForeignKey(Society, on_delete=models.CASCADE, null=False)
    categoryId = models.ForeignKey(SocietyCategoriesType, on_delete=models.CASCADE, null=False)
