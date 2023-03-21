from rest_framework import status, generics
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated, BasePermission
from rest_framework.authentication import TokenAuthentication
from rest_framework.filters import OrderingFilter
from rest_framework.views import APIView
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError
from django_filters.rest_framework import DjangoFilterBackend

from .serializers import *
from .models import *

from datetime import date, datetime
import json

#Permission classes
class AllowPost(BasePermission):
    def has_permission(self, request, view):
        return request.method == "POST"

#URl Endpoints

@api_view(['GET'])
@permission_classes({AllowAny})
def homePage(request):
    socs = Society.objects.all()
    serializer = SocietyHomePageSerializer(socs, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def log_out(request):
    logout(request)
    return Response(data={'user_logged_out': True}, status=status.HTTP_200_OK)

class LogInView(APIView):
    """Log in view to authenticate the user."""
    authentication_classes = [TokenAuthentication]
    permission_classes = [AllowAny,]

    def get(self, request, format=None):
        content = {
            'user': str(request.user),  # `django.contrib.auth.User` instance.
            'auth': str(request.auth),  # None
        }
        return Response(content)
    
    #@csrf_exempt
    def post(self, request, format=None):
        
        username = request.data.get('email')
        password = request.data.get('password')
    
        if username is None or password is None:
            return Response(
                {
                    'error': 'Please provide both email and password'
                },
                status = status.HTTP_400_BAD_REQUEST
            )
        
        user = authenticate(username=username, password=password)
    
        if not user:
            return Response(
                {
                    'error': 'Invalid credentials'
                },
                status = status.HTTP_404_NOT_FOUND
            )
        
        token, _ = Token.objects.get_or_create(user=user)
        login(request, user)
        
        # if user.is_authenticated:
        #     print("TRUE --- USER IS LOGGED IN")
        # print({'token': token.key,
        #     'email': user.email,
        #     'is_authenticated' : user.is_authenticated
        #     })
        
        return Response(
            {
                'token': token.key,
                'email': user.email,
                'is_authenticated' : user.is_authenticated,
                'user_level': user.user_level,
                'user_id': user.id
            },
            status = status.HTTP_200_OK
        )

class UsersListView(generics.ListAPIView):
    """View to retrieve list of users"""
    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    permission_classes = [IsAuthenticated|AllowPost]
    
    def post(self,request):
        auth_content = request.data.get('user')
        uni_content = request.data.get('university_studying_at')

        # Will change this to obtain the uni via id not name as discussed.
        u = ""
        try:
            u = University.objects.get(id=uni_content)
        except:
            return Response({'error':'University not found'},status=status.HTTP_400_BAD_REQUEST)

        try:
            # First, we create the user object, before we can actually create the society model.
            validate_password(auth_content['password'])
            created_user = User.objects.create_user(
                email = auth_content['email'], 
                password = auth_content['password'],
                # Level 1 as a nonstudent is being created.
                user_level = 1
            )
        except ValidationError as e:
            return Response(e,status=status.HTTP_409_CONFLICT)
        except:
            # If there is already an account with that email, we throw an error.
            return Response({'error':'User could not be created.'},status=status.HTTP_409_CONFLICT)
        
        else:
            data = {
                'pk': created_user.id,
                'user': auth_content,
                'first_name': request.data.get('first_name'),
                'last_name': request.data.get('last_name'),
                'field_of_study': request.data.get('field_of_study'),
                
                #Assume that the uni data is correct since it will be seeded.
                'university_studying_at': uni_content,
            }
            
            # Create a new person model.
            new_person = People.objects.create(
                user = created_user,
                first_name = data['first_name'],
                last_name = data['last_name'],
                field_of_study = data['field_of_study'],
                university_studying_at = u
            )
            
            try:
                new_person.full_clean()
            except:
                created_user.delete() # delete user since error
                return Response({'errorM': "An error message"}, status=status.HTTP_400_BAD_REQUEST)
            
            new_person.save()
            
            # Serialize the new model and send back to the frontend.
            try:
                serializer = PeopleSerializer(new_person)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except Exception as e:
                created_user.delete()
                new_person.delete()
                return Response(e, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class UserView(APIView):
    """View to retrieve data about a user"""

    def get(self, request, pk, format='json'):
        try:
            user = User.objects.get(id=pk)
            serializer = UserSerializer(user)
            return Response(serializer.data)
        except:
            return Response({'error':'User not found.'},status=status.HTTP_404_NOT_FOUND)

    def put(self, request, pk):
        if(pk != request.user.id):
            return Response({'error':'Can only change our own user data.'},status=status.HTTP_400_BAD_REQUEST)
        
        user = User.objects.get(id=pk)
        serializer = UserSerializer(instance=user, data=request.data,partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        
        try:
            new_pass = request.data['password']
        except:
            new_pass = False
        
        if new_pass == False:
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            try:
                validate_password(new_pass)
                user.set_password(new_pass)
                user.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except ValidationError as e:
                return Response(e, status=status.HTTP_400_BAD_REQUEST)
            except:
                return Response({'error':'Details saved except password'}, status=status.HTTP_400_BAD_REQUEST)



class PeopleListView(generics.ListAPIView):
    """ View list of all people accounds"""

    queryset = People.objects.all()
    serializer_class = PeopleSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'

class PeopleView(APIView):
    """ View a specific people account"""
    def get(self, request, pk):
        try:
            user = People.objects.get(user=pk)
            serializer = PeopleSerializer(user)
            return Response(serializer.data)
        except:
            return Response({'error':'Person not found.'},status=status.HTTP_404_NOT_FOUND)

    def put(self, request, pk):
        people = People.objects.get(user_id=pk)
        serializer = PeopleSerializer(instance=people, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

class SocietyListView(generics.ListAPIView):
    """View to retrieve list of societies"""
    
    queryset = Society.objects.all()
    serializer_class = SocietySerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = ['user','name','creation_date','university_society_is_at','join_date']
    ordering_fields = '__all__'
    permission_classes = [IsAuthenticated|AllowPost]
    
    def post(self,request):
        
        auth_content = request.data.get('user')
        uni_content = request.data.get('university_society_is_at')
        # Will change this to obtain the uni via id not name as discussed.
        try:
            u = University.objects.get(id=uni_content)
        except:
            return Response({'error':'University not found.'},status=status.HTTP_400_BAD_REQUEST)

        try:
            # First, we create the user object, before we can actually create the society model.
            validate_password(auth_content['password'])
            created_user = User.objects.create_user(
                email = auth_content['email'], 
                password = auth_content['password'],
                # Level 3 for society type.
                user_level = 3
            )
        except ValidationError as e:
            return Response(e,status=status.HTTP_409_CONFLICT)
        except Exception as l:
            print(l)
            # If there is already an account with that email, we throw an error.
            return Response({'error':'Email is taken.'},status=status.HTTP_409_CONFLICT)
        
        else:
            data = {
                'pk': created_user.id,
                'user': auth_content,
                'name': request.data.get('name'),
                'creation_date': datetime.strptime(request.data.get('creation_date'), '%d/%m/%Y').date(),
                #Assume that the uni data is correct since it will be seeded.
                'university_society_is_at': uni_content,
            }

            # Create a new society model.
            new_society = Society.objects.create(
                user = created_user,
                name = data['name'],
                creation_date = data['creation_date'],
                university_society_is_at = u,
                about_us = request.data.get('about_us')
            )
                      
            try:
                new_society.full_clean()
            except Exception as e:
                created_user.delete()
                return Response(e, status=status.HTTP_400_BAD_REQUEST)
            
            new_society.save()

            #Create categories for society
            try:
                categories = request.data['categories']
                for i in categories:
                    SocietyCategories.objects.create(societyId=new_society, categoryId=SocietyCategoriesType.objects.get(id=i)).save();
            except Exception as l:
                print(l)
                created_user.delete()
                return Response({'error':'Error in creating categories'}, status=status.HTTP_400_BAD_REQUEST)

            try:
                # Serialize the new model and send back to the frontend.
                serializer = SocietySerializer(new_society)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except Exception as e:
                created_user.delete()
                new_society.delete()
                return Response(e, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            
class SocietyView(APIView):
    """View to retrieve data about a society"""
    def get(self, request, pk, format='json'):
        try:
            soc = Society.objects.get(pk=pk)
            serializer = SocietySerializer(soc)
            return Response(serializer.data)
        except:
            return Response({'error':'Society not found.'},status=status.HTTP_404_NOT_FOUND)
    
    def put(self, request, pk):
        soc = Society.objects.get(user_id=pk)
        serializer = SocietySerializer(instance=soc, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        try:
            new_pass = request.data['password']
        except:
            new_pass = False

        if new_pass == False:
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            
            if (pk != request.user.id):
                return Response({'error':'Can only change our own society password.'},status=status.HTTP_400_BAD_REQUEST)
            user = User.objects.get(id=pk)
            try:
                validate_password(new_pass)
                user.set_password(new_pass)
                user.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except ValidationError as e:
                return Response(e, status=status.HTTP_400_BAD_REQUEST)
            except:
                return Response({'error':'Details saved except password'}, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk):
        Society.objects.filter(user_id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['POST'])
def society_join(request):
    #if user if society email, allow access
    if request.user.user_level == 3:
        #Society account can not join other societies
        return Response(status=status.HTTP_400_BAD_REQUEST)
    else:
        #check if they have adequte permission
        #search for the society that they want
        try:
            soc = Society.objects.get(user_id=request.data['society'])
        except:
            return Response({'error':'Society not found'}, status=status.HTTP_404_NOT_FOUND)
        
        #check if they are already part of the society
        try:
            role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=People.objects.get(user=request.user))
            return Response({'error':'Already joined society'},status=status.HTTP_400_BAD_REQUEST)
        except:
            soc.join_soc(request.user)
            soc.save()

            return Response(status=status.HTTP_201_CREATED)

@api_view(['POST'])
def society_remove_user(request):
    try:
        user = request.data['user']
    except:
        user = ""

    if user:
        #THIS IS FOR REMOVING ANOTHER USER

        #search for the society that they want
        try:
            soc = Society.objects.get(user_id=request.data['society'])
        except:
            return Response({'error':'Society not found'}, status=status.HTTP_404_NOT_FOUND)

        if request.user.user_level == 3:
             #check if they are already part of the society
            try:
                role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=People.objects.get(user_id=user))
            except:
                return Response({'error':'Not joined society'},status=status.HTTP_400_BAD_REQUEST)

            role.delete()
        else:
            #check for society level of the current user to be deleted
            try:
                user_role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=People.objects.get(user=request.user))
            except:
                return Response({'error':'User has not joined society'},status=status.HTTP_400_BAD_REQUEST)
            
            #check if the user to be removed is in the society
            try:
                role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=People.objects.get(user_id=user))
            except:
                return Response({'error':'User to delete has not joined society'},status=status.HTTP_400_BAD_REQUEST)

            #check if the user has more power than the user being removed
            if user_role.role > role.role:
                role.delete()
            else:
                return Response({'error':'User does not have enough power to remove the current user.'},status=status.HTTP_400_BAD_REQUEST)
       
        return Response(status=status.HTTP_204_NO_CONTENT)
    else:
        #THIS IS TO REMOVE SELF FROM SAID SOCIETY
        #remove self from soc
        if request.user.user_level == 3:
            #Society account can not leave their own society
            return Response({'error':'Society account can not leave a society.'},status=status.HTTP_400_BAD_REQUEST)
        else:
            #check if they have adequte permission
            #search for the society that they want
            try:
                soc = Society.objects.get(user_id=request.data['society'])
            except:
                return Response({'error':'Society not found.'}, status=status.HTTP_404_NOT_FOUND)
            
            #check if they are already part of the society
            people = People.objects.get(user=request.user)
            try:
                role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=people)
            except:
                return Response({'error':'Not part of society'},status=status.HTTP_400_BAD_REQUEST)

            role.delete()

            return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['POST'])
def society_update_user(request):
    if request.user.user_level == 3:
        #society user can only edit roles for their own society
        try:
            soc = request.data['society']
            return Response({'error':'You can only edit roles in your own society'},status=status.HTTP_400_BAD_REQUEST)
        except:
            pass

        #Get their society
        soc = Society.objects.get(user=request.user)

        #check if they are already part of the society
        try:
            update_role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.data['user'])
        except:
            return Response({'error':'User has not joined society'},status=status.HTTP_400_BAD_REQUEST)

        if request.data['role_level'] in {1,2,3}:
            update_role.role = request.data['role_level']
            update_role.save()
        else:
            return Response({'error':'Can not set level'},status=status.HTTP_400_BAD_REQUEST)
    else:
        #check if they have adequte permission
        #search for the society that they want
        try:
            soc = Society.objects.get(user_id=request.data['society'])
        except:
            return Response({'error':'Society not found'}, status=status.HTTP_404_NOT_FOUND)
        
        #check if current user is part of the society
        try:
            curr_role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.user.id)
        except:
            return Response({'error':'User has not joined society'},status=status.HTTP_400_BAD_REQUEST)

        #check if they are already part of the society
        try:
            update_role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.data['user'])
        except:
            return Response({'error':'User not joined society'},status=status.HTTP_400_BAD_REQUEST)

        #check if they have power to update
        if curr_role.role in {2,3}:
            #check if it is a valid role and if they user has enough power to update
            if request.data['role_level'] in {1,2} and curr_role.role>request.data['role_level']:
                update_role.role = request.data['role_level']
                update_role.save()
            else:
                return Response({'error':'Can not set level'},status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({'error':'User does not have adequte power.'},status=status.HTTP_400_BAD_REQUEST)
            

    return Response(status=status.HTTP_204_NO_CONTENT)

#get a list of all the roles in society
class PeopleRoleAtSocietyView(generics.ListAPIView):
    queryset = PeopleRoleAtSociety.objects.all()
    serializer_class = PeopleRoleAtSocietySerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = {
        'society': ['exact'],
        'user_at_society': ['exact'],
        'role': ['exact','lt','gt','gte','lte']
    }
    ordering_fields = '__all__'

# Get list of all events
class EventApiView(generics.ListAPIView):
    queryset = Event.objects.all()
    serializer_class = EventModelSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    
    def post(self, request):
        serializer = EventModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

#Event with id
class EventApiInfoView(APIView):
    def get(self, request, pk):
        event = Event.objects.filter(id=pk)
        serializer = EventModelSerializer(instance=event)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def put(self, request, pk):
        event = Event.objects.filter(id=pk).first()
        serializer = EventModelSerializer(instance=event, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def delete(self, request, pk):
        Event.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# list of all the universitues
class UniversityApiView(generics.ListAPIView):
    queryset = University.objects.all()
    serializer_class = UniversitySerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    permission_classes = [AllowAny]

     # Add in list for all categories.
    def get(self, request):
        universities = University.objects.all()
        serializer = UniversitySerializer(instance=universities, many=True)
        return Response(data=serializer.data, status=status.HTTP_200_OK)
    
    def post(self, request):
        serializer = UniversitySerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

#Get university with id
class UniversityInfoApiView(APIView):
    def get(self, request, pk):
        university = University.objects.filter(id=pk)
        serializer = UniversitySerializer(instance=university)
        return Response(serializer.data)

    def put(self, request, pk):
        university = University.objects.filter(id=pk).first()
        request.data["name"] = pk
        serializer = UniversitySerializer(instance=university, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, request, pk):
        University.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#get a list of all the tickets
class TicketApiView(generics.ListAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TicketModelSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'

    def post(self, request):
        serializer = TicketModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

#ticket with id
class TicketInfoApiView(APIView):
    def get(self, request, pk):
        ticket = Ticket.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=ticket)
        return Response(data=serializer.data)

    def put(self, request, pk):
        ticket = Ticket.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=ticket, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, request, pk):
        Ticket.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#get list of all event category types
class EventCategoriesTypeApiView(generics.ListAPIView):
    queryset = EventCategoriesType.objects.all()
    serializer_class = EventCategoriesTypeModelSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = EventCategoriesTypeModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

#Get event category type with id
class EventCategoriesTypeInfoApiView(APIView):
    def get(self, request, pk):
        eventCategoriesType = EventCategoriesTypeModelSerializer.objects.filter(id=pk).first()
        serializer = EventCategoriesTypeModelSerializer(instance=eventCategoriesType)
        return Response(data=serializer.data)

    def put(self, request, pk):
        eventCategoriesType = EventCategoriesTypeModelSerializer.objects.filter(id=pk).first()
        serializer = EventCategoriesTypeModelSerializer(instance=eventCategoriesType, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        EventCategoriesType.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# Get all event catergories
class EventCategoriesApiView(generics.ListAPIView):
    queryset = EventCategories.objects.all()
    serializer_class = EventCategoriesModelSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'

    def post(self, request):
        serializer = EventCategoriesModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

#Get event category with id
class EventCategoriesInfoApiView(APIView):
    def get(self, request, pk):
        eventCategories = EventCategories.objects.filter(id=pk).first()
        serializer = EventCategoriesModelSerializer(instance=eventCategories)
        return Response(data=serializer.data)

    def put(self, request, pk):
        eventCategories = EventCategories.objects.filter(id=pk).first()
        serializer = EventCategoriesModelSerializer(instance=eventCategories, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        EventCategories.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# get all society category types
class SocietyCategoriesTypeApiView(generics.ListAPIView):
    queryset = SocietyCategoriesType.objects.all()
    serializer_class = SocietyCategoriesTypeModelSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    permission_classes = [AllowAny]
    
    # Add in list for all categories.
    def get(self, request):
        societyCategoriesType = SocietyCategoriesType.objects.all()
        serializer = SocietyCategoriesTypeModelSerializer(instance=societyCategoriesType, many=True)
        return Response(data=serializer.data, status=status.HTTP_200_OK)


    def post(self, request):
        serializer = SocietyCategoriesTypeModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

#Get society category type with id
class SocietyCategoriesTypeInfoApiView(APIView):
    
    def get(self, request, pk):
        societyCategoriesType = SocietyCategoriesType.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=societyCategoriesType)
        return Response(data=serializer.data)

    def put(self, request, pk):
        societyCategoriesType = SocietyCategoriesType.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=societyCategoriesType, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        SocietyCategoriesType.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Get all society categories
class SocietyCategoriesApiView(generics.ListAPIView):

    queryset = SocietyCategories.objects.all()
    serializer_class = SocietyCategoriesModelSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = "__all__"
    ordering_fields = '__all__'

    def post(self, request):
        serializer = SocietyCategoriesModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

#Get society categories with id
class SocietyCategoriesInfoApiView(APIView):
    def get(self, request, pk):
        societyCategories = SocietyCategories.objects.filter(id=pk).first()
        serializer = SocietyCategoriesModelSerializer(instance=societyCategories)
        return Response(data=serializer.data)

    def put(self, request, pk):
        societyCategories = SocietyCategories.objects.filter(id=pk).first()
        serializer = SocietyCategoriesModelSerializer(instance=societyCategories, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        SocietyCategories.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)