import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import EmailValidator
from .managers import UserManager


# Create your models here.
class University(models.Model):
    name = models.CharField(primary_key=True, max_length=50, blank=False)
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
        (1, 'student'),
        (2, 'committee'),
        (3, 'inner_circle_of_society'),
        (4, 'president_of_society'),  # This is the person who accessess the actual society email.
        (5, 'administrator'),
    )

    user_level = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES, default=1)

    objects = UserManager()

    def __str__(self):
        return self.email


class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    university_studying_at = models.ForeignKey(University, on_delete=models.CASCADE)

    first_name = models.CharField(blank=False, unique=False, max_length=40)
    last_name = models.CharField(blank=False, unique=False, max_length=40)

    field_of_study = models.CharField(blank=False, unique=False, max_length=30)


class Society(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, blank=False)
    name = models.CharField(blank=False, unique=False, max_length=40)
    creation_date = models.DateField(blank=False)

    # Add category stuff later

    university_society_is_at = models.ForeignKey(University, on_delete=models.CASCADE)
    join_date = models.DateField(auto_now_add=True)

    def set_role(self, user: User, level):
        # Assign the role that the society wants to give to the user.
        user.user_level = level
        user.save()

        # Store this info in the StudentRoleAtSociety database.
        role_given = StudentRoleAtSociety.objects.create(
            society=self,
            user_at_society=user
        )
        role_given.full_clean()
        role_given.save()

    def update_student_role(self, user: User, level):
        # Retrieve the user from the societal roles db and delete them to avoid violating the unique constraint.
        user_working_for_society = StudentRoleAtSociety.objects.get(
            society=self,
            user_at_society=Student.objects.get(user=user)
        )

        user_working_for_society.delete()

        self.set_role(user, level)

    def delete_student_role(self, user: User):
        user_working_for_society = StudentRoleAtSociety.objects.get(
            society=self,
            user_at_society=Student.objects.get(user=user)
        )
        user_working_for_society.delete()


class StudentRoleAtSociety(models.Model):
    class Meta:
        db_table = 'tickets'
        constraints = [
            models.UniqueConstraint(
                fields=[
                    'society',
                    'user_at_society'
                ],
                name='user_identification'
            )
        ]

    society = models.ForeignKey(Society, on_delete=models.CASCADE, blank=False)
    user_at_society = models.ForeignKey(Student, on_delete=models.CASCADE, blank=False)

    def __str__(self):
        str1 = self.society.name + " --- " + self.user_at_society.first_name + self.user_at_society.last_name + " --- "
        str2 = str(self.user_at_society.user.user_level)
        return str1 + str2


class Event(models.Model):
    # modify here
    society_id = models.ForeignKey(Society, on_delete=models.CASCADE, blank=False)
    duration = models.IntegerField(blank=False, unique=False)
    event_date = models.DateTimeField(blank=False)
    event_name = models.CharField(max_length=50, blank=False)
    location = models.CharField(max_length=50, blank=True)
    description = models.CharField(max_length=500, blank=True)
    price = models.FloatField(max_length=10, blank=False)
    update_time = models.DateTimeField(auto_now=datetime.datetime.now(), blank=False)
    create_time = models.DateTimeField(auto_now_add=datetime.datetime.now(), blank=False)

    class Meta:
        verbose_name = "event"
        verbose_name_plural = verbose_name

    def __str__(self):
        # the result must is string type
        return
        self.society_id,
        self.duration,
        self.event_date,
        self.event_name,
        self.location,
        self.description,
        self.price,
        self.update_time,
        self.create_time


class Ticket(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE, null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=False)
    date = models.DateTimeField(blank=False)
    price = models.FloatField(blank=False, default=0.0)


class EventCategoriesType(models.Model):
    category_name = models.CharField(max_length=200, null=False)


class EventCategories(models.Model):
    societyId = models.ForeignKey(Society, on_delete=models.CASCADE, null=False)
    categoryId = models.ForeignKey(EventCategoriesType, on_delete=models.CASCADE, null=False)


class SocietyCategoriesType(models.Model):
    category_name = models.CharField(max_length=200, null=False)


class SocietyCategories(models.Model):
    societyId = models.ForeignKey(Society, on_delete=models.CASCADE, null=False)
    categoryId = models.ForeignKey(SocietyCategoriesType, on_delete=models.CASCADE, null=False)

# class Buys(models.Model):
#     """buys """
#     number_of_tickets = models.IntegerField(blank=False)
#     event_id = models.ForeignKey(Event, on_delete=models.CASCADE, blank=False)
#     student_email = models.CharField(blank=True, max_length=50)
#
#     def __str__(self):
#         return self.number_of_tickets, self.event_id, self.student_email
#
#
# class Hosts(models.Model):
#     event_id = models.ForeignKey(Event, models.CASCADE, blank=False)
#     student_email = models.CharField(blank=True, max_length=50)
