from rest_framework import serializers
from api.models import Student, User, University, Society, Event, Buys, Hosts
import re

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'email']


class UniversitySerializer(serializers.ModelSerializer):
    class Meta:
        model = University
        fields = '__all__'


class SocietySerializer(serializers.ModelSerializer):
    class Meta:
        model = Society
        fields = ['id', 'user', 'name', 'creation_date', 'university_data', 'join_date']


class EventModelSerializer(serializers.ModelSerializer):
    """Event Model Serializer """

    def validate_society_email(self, data):
        if not re.match(r'^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', data):
            raise serializers.ValidationError(detail="Incorrect email format")
        return data

    class Meta:
        model = Event
        fields = "__all__"
        extra_kwargs = {
            "duration": {
                "min_value": 1,
                "error_messages": {
                    "min_value": "The duration value must be greater than 0"
                }
            }
        }


class UniversityModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = University
        fields = "__all__"
