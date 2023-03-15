from rest_framework import serializers

from api.models import *
import re

class PeopleSerializer(serializers.ModelSerializer):
    class Meta:
        model = People
        fields = '__all__'
 
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id','email','user_level','date_joined']
        
class UniversitySerializer(serializers.ModelSerializer):
    class Meta:
        model = University
        fields = '__all__'

class SocietySerializer(serializers.ModelSerializer):
    # image = serializers.SerializerMethodField()
    user = UserSerializer()
    university_society_is_at = UniversitySerializer()
    

    class Meta:
        model = Society
        fields = ['user','name','creation_date','about_us','university_society_is_at','join_date']
    
    def get_image(self, society):
        print("THIS")
        print(society.image.url)
        return society.image.url

        
class PeopleRoleAtSocietySerializer(serializers.ModelSerializer):
    class Meta:
        model = PeopleRoleAtSociety
        fields = '__all__'
        
"""Serializers for creating users"""
class UserCreationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email', 'password']
class SocietyCreationSerializer(serializers.ModelSerializer):
    user = UserCreationSerializer()
    university_society_is_at = UniversitySerializer()
    class Meta:
        model = Society
        fields = ['user', 'name', 'creation_date', 'university_society_is_at', 'join_date', 'image']

class PeopleCreationSerializer(serializers.ModelSerializer):
    user = UserCreationSerializer()
    university_studying_at = UniversitySerializer()
    class Meta:
        model = People
        fields = '__all__'

"""
"""


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