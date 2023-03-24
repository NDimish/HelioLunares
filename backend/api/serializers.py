from rest_framework import serializers
from api.models import *
 
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id','email','user_level','date_joined']

class UniversitySerializer(serializers.ModelSerializer):
    class Meta:
        model = University
        fields = '__all__'

class PeopleSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    university_studying_at = UniversitySerializer()

    class Meta:
        model = People
        fields = '__all__'

class SocietySerializer(serializers.ModelSerializer):
    image = serializers.SerializerMethodField()
    user = UserSerializer()
    university_society_is_at = UniversitySerializer()

    class Meta:
        model = Society
        fields = '__all__'
    
    def get_image(self, society):
        if society.image:
            return society.image.url
        else:
            return "media/default-image.png"

class PeopleRoleAtSocietySerializer(serializers.ModelSerializer):
    society = SocietySerializer()
    user_at_society = PeopleSerializer()

    class Meta:
        model = PeopleRoleAtSociety
        fields = '__all__'

class EventModelSerializer(serializers.ModelSerializer):
    """Event Model Serializer """
    society_id = SocietySerializer()
    
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

class TicketModelSerializer(serializers.ModelSerializer):
    event = EventModelSerializer()
    user = UserSerializer()

    class Meta:
        model = Ticket
        fields = "__all__"

class EventCategoriesTypeModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = EventCategoriesType
        fields = "__all__"

class EventCategoriesModelSerializer(serializers.ModelSerializer):
    eventId = EventModelSerializer()
    categoryId = EventCategoriesTypeModelSerializer()

    class Meta:
        model = EventCategories
        fields = "__all__"

class SocietyCategoriesTypeModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = SocietyCategoriesType
        fields = "__all__"

class SocietyCategoriesModelSerializer(serializers.ModelSerializer):
    societyId = SocietySerializer()
    categoryId = SocietyCategoriesTypeModelSerializer()

    class Meta:
        model = SocietyCategories
        fields = "__all__"
    
class SocietyHomePageSerializer(serializers.ModelSerializer):
    image = serializers.SerializerMethodField()

    class Meta:
        model = Society
        fields = ['name','image', 'about_us']
    
    def get_image(self, society):
        if society.image:
            return society.image.url
        else:
            return "media/default-image.png"

class CreateTicketSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = '__all__'

class CreateEventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Event
        fields = '__all__'
    