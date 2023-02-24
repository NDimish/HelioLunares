from rest_framework import serializers
from ticketing_api.models import UserTest
from django.contrib.auth.models import User


class UserTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserTest
        fields = ['id', 'title', 'code', 'linenos']


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'password']