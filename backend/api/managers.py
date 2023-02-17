from django.db import models
from django.contrib.auth.models import BaseUserManager

class UserManager(BaseUserManager):
    """Define a model manager for User model with no username field."""

    def create_user(self, password=None, **kwargs):
        if not kwargs.get("email"):
            raise ValueError("Users must have an email address")
    
        email = kwargs.get("email")
        user = self.model(email=self.normalize_email(email))
        user.set_password(password)

        if kwargs.get("user_level"):
            user.user_level = kwargs.get("user_level")


        user.save()
        return user
    
    def create_superuser(self, email, password=None, **kwargs):
        user = self.create_user(email=email, password=password, **kwargs)
        user.is_superuser = True
        user.is_staff = True
        user.user_level = 5
        user.save()
        return user