from rest_framework import serializers

from api.models import Student, User, University, Society, Event
import re

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'
 
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id','email']
        
class UniversitySerializer(serializers.ModelSerializer):
    class Meta:
        model = University
        fields = '__all__'

class SocietySerializer(serializers.ModelSerializer):
    user = UserSerializer()
    university_society_is_at = UniversitySerializer()
    class Meta:
        model = Society
        fields = ['pk', 'user', 'name', 'creation_date', 'university_society_is_at', 'join_date']
        
        
        
        
        
"""@Jaidev, I added these two creation serializers because im not too sure on how to deserialize a nested object.
    So when creating a society object, the user just puts in their email and password, which is what we want.
    Then when we create a society object, we just put in the recently created user, the soc name, 
    the university, which we get via putting in the name of the uni into the uni relation, and the join date should
    be genererated automatically.
"""
class UserCreationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['email', 'password']
class SocietyCreationSerializer(serializers.ModelSerializer):
    user = UserCreationSerializer()
    university_society_is_at = UniversitySerializer()
    class Meta:
        model = Society
        fields = ['user', 'name', 'creation_date', 'university_society_is_at', 'join_date']

class StudentCreationSerializer(serializers.ModelSerializer):
    user = UserCreationSerializer()
    university_studying_at = UniversitySerializer()
    class Meta:
        model = Student
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