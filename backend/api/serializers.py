from rest_framework import serializers
from api.models import Student, User, University, Society

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
    class Meta:
        model = Society
        fields = ['user','name','creation_date','university_society_is_at','join_date']