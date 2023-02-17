from rest_framework import serializers
from ticketing_api.models import UserTest


class UserTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserTest
        fields = ['id', 'title', 'code', 'linenos']