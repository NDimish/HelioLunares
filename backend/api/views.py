from rest_framework import status, generics
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework.filters import OrderingFilter
from rest_framework.views import APIView

from django.contrib.auth import authenticate, login, logout
from django_filters.rest_framework import DjangoFilterBackend

from .models import User, Society, Event, University, People, PeopleRoleAtSociety
from .serializers import *
import json
#nathan testing
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.shortcuts import render
from rest_framework import generics

from datetime import date, datetime


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
                'is_authenticated' : user.is_authenticated
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
    permission_classes = [AllowAny]

    
    def post(self,request):
        auth_content = request.data.get('user')
        uni_content = request.data.get('university_studying_at')

        # Will change this to obtain the uni via id not name as discussed.
        u = University.objects.get(id=uni_content)
        
        try:
            # First, we create the user object, before we can actually create the society model.
            created_user = User.objects.create_user(
                email = auth_content['email'], 
                password = auth_content['password'],
                # Level 1 as a nonstudent is being created.
                user_level = 1
            )
            
        except:
            # If there is already an account with that email, we throw an error.
            return Response(status=status.HTTP_409_CONFLICT)
        
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
            
            # Create a new society model.
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
            
            try:
                # Serialize the new model and send back to the frontend.
                serializer = PeopleSerializer(new_person)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except:
                # If there is an error, delete the data
                created_user.delete() # due to cascade it will auto delete new_person
                return Response(serializer.data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    

class UserView(APIView):
    """View to retrieve data about a user"""

    def get(self, request, pk, format='json'):
        try:
            user = User.objects.get(id=pk)
            serializer = UserSerializer(user)
            return Response(serializer.data)
        except:
            return Response({'error':'User not found.'},status=status.HTTP_404_NOT_FOUND)
    def delete(self, request, pk):
        User.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

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
            return Response({'error':'User not found.'},status=status.HTTP_404_NOT_FOUND)
    
    def delete(self, request, pk):
        User.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class SocietyListView(generics.ListAPIView):
    """View to retrieve list of societies"""
    
    queryset = Society.objects.all()
    serializer_class = SocietySerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    permission_classes = [AllowAny]
    
    def post(self,request):
        
        auth_content = request.data.get('user')
        uni_content = request.data.get('university_society_is_at')
        # Will change this to obtain the uni via id not name as discussed.
        u = University.objects.get(id=uni_content)
        
        try:
            
            # First, we create the user object, before we can actually create the society model.

            created_user = User.objects.create_user(
                email = auth_content['email'], 
                password = auth_content['password'],
                # Level 3 for society type.
                user_level = 3
            )
            
        except:
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
                image = request.data.get('image')
            )
            
            try:
                new_society.full_clean()
            except:
                created_user.delete()
                return Response({'errorM': "An error message"}, status=status.HTTP_400_BAD_REQUEST)
            
            new_society.save()
            
            try:
                # Serialize the new model and send back to the frontend.
                serializer = SocietySerializer(new_society)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except:
                created_user.delete()
                new_society.delete()
                return Response(serializer.data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            
class SocietyView(APIView):
    """View to retrieve data about a society"""
    def get(self, request, pk, format='json'):
        try:
            soc = Society.objects.get(pk=pk)
            serializer = SocietySerializer(soc)
            return Response(serializer.data)
        except:
            return Response({'error':'Society not found.'},status=status.HTTP_404_NOT_FOUND)
    def delete(self, request, pk):
        Society.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['POST'])
def society_join(request):
    #if user if society email, allow access
    print(request.user.user_level)
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
            role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.user)
            return Response({'error':'Already joined society'},status=status.HTTP_400_BAD_REQUEST)
        except:
            soc.join_soc(request.user)
            soc.save()

            return Response(status=status.HTTP_201_CREATED)

@api_view(['POST'])
def society_remove_user(request):
    if request.data['user']:
        #THIS IS FOR REMOVING ANOTHER USER

        #search for the society that they want
        try:
            soc = Society.objects.get(user_id=request.data['society'])
        except:
            return Response({'error':'Society not found'}, status=status.HTTP_404_NOT_FOUND)

        if request.user.user_level == 3:
             #check if they are already part of the society
            try:
                role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.user)
            except:
                return Response({'error':'Not joined society'},status=status.HTTP_400_BAD_REQUEST)

            role.delete()
        else:
            #check for society level of the current user to be deleted
            try:
                user_role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.user)
            except:
                return Response({'error':'User has not joined society'},status=status.HTTP_400_BAD_REQUEST)
            
            #check if the user to be removed is in the society
            try:
                role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.user)
            except:
                return Response({'error':'Not joined society'},status=status.HTTP_400_BAD_REQUEST)

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
                return Response({'error':'Society not found'}, status=status.HTTP_404_NOT_FOUND)
            
            #check if they are already part of the society
            try:
                role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.user)
            except:
                return Response({'error':'Not joined society'},status=status.HTTP_400_BAD_REQUEST)

            role.delete()

            return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['POST'])
def society_update_user(request):
    print(request.user.user_level)
    if request.user.user_level == 3:
        #Look for society
        try:
            soc = Society.objects.get(user_id=request.data['society'])
        except:
            return Response({'error':'Society not found'}, status=status.HTTP_404_NOT_FOUND)

        #check if they are already part of the society
        try:
            update_role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.data['user'])
        except:
            return Response({'error':'User not joined society'},status=status.HTTP_400_BAD_REQUEST)

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
            curr_role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.user)
        except:
            return Response({'error':'User has not joined society'},status=status.HTTP_400_BAD_REQUEST)

        if curr_role != 3:
            return Response({'error':'User does not have adequte power.'},status=status.HTTP_400_BAD_REQUEST)

        #check if they are already part of the society
        try:
            update_role = PeopleRoleAtSociety.objects.get(society=soc,user_at_society=request.data['user'])
        except:
            return Response({'error':'User not joined society'},status=status.HTTP_400_BAD_REQUEST)

        if request.data['role_level'] in {1,2}:
            update_role.role = request.data['role_level']
            update_role.save()
        else:
            return Response({'error':'Can not set level'},status=status.HTTP_400_BAD_REQUEST)

    return Response(status=status.HTTP_204_NO_CONTENT)

class PeopleRoleAtSociety(generics.ListAPIView):
    queryset = PeopleRoleAtSociety.objects.all()
    serializer_class = PeopleRoleAtSocietySerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'

# @permission_classes([IsAuthenticated])
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


# @permission_classes([IsAuthenticated])
class EventApiInfoView(APIView):
    def get(self, request, pk):
        event = Event.objects.filter(id=pk)
        serializer = EventModelSerializer(instance=event, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def put(self, request, pk):
        event = Event.objects.filter(id=pk).first()
        serializer = EventModelSerializer(instance=event, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    
    def delete(self, request, pk):
        Event.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# @permission_classes([IsAuthenticated])
class UniversityApiView(generics.ListAPIView):
    queryset = University.objects.all()
    serializer_class = UniversitySerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'

    def post(self, request):
        serializer = UniversitySerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)


@permission_classes([IsAuthenticated])
class UniversityInfoApiView(APIView):
    def get(self, request, pk):
        university = University.objects.filter(id=pk)
        serializer = UniversitySerializer(instance=university, many=True)
        return Response(serializer.data)

    def put(self, request, pk):
        university = University.objects.filter(id=pk).first()
        request.data["name"] = pk
        serializer = UniversitySerializer(instance=university, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, request, pk):
        University.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)