from rest_framework import serializers

from api.models import Student, User, University, Society, Event, Ticket, EventCategoriesType, \
    EventCategories, SocietyCategoriesType, SocietyCategories

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

    # def validate_society_email(self, data):
    #     if not re.match(r'^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$', data):
    #         raise serializers.ValidationError(detail="Incorrect email format")
    #     return data

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


class TicketModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = "__all__"


class EventCategoriesTypeModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = EventCategoriesType
        fields = "__all__"


class EventCategoriesModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = EventCategories
        fields = "__all__"


class SocietyCategoriesTypeModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = SocietyCategoriesType
        fields = "__all__"


class SocietyCategoriesModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = SocietyCategories
        fields = "__all__"

# class BuysModelSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Buys
#         fields = "__all__"
#
#
# class HostsModelSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Hosts
#         fields = "__all__"
