from rest_framework import status, generics
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from rest_framework.filters import OrderingFilter
from rest_framework.views import APIView

from django.contrib.auth import authenticate, login, logout
from django_filters.rest_framework import DjangoFilterBackend

from .models import User, Society, Event, University, Student
from .serializers import UserSerializer, SocietySerializer, UniversitySerializer, EventModelSerializer, SocietyCreationSerializer, StudentSerializer, StudentCreationSerializer

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
    authentication_classes = [SessionAuthentication, TokenAuthentication]
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
    queryset = Student.objects.all()
    serializer_class = StudentSerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    
    def get_serializer_class(self):
        if self.request.method == 'POST':
            return StudentCreationSerializer
        return StudentSerializer
    
    def post(self,request):
        auth_content = request.data.get('user')
        uni_content = request.data.get('university_studying_at')

        # Will change this to obtain the uni via id not name as discussed.
        u = University.objects.get(name=uni_content['name'])
        
        try:
            # First, we create the user object, before we can actually create the society model.
            created_user = User.objects.create_user(
                email = auth_content['email'], 
                password = auth_content['password'],
                # Level 1 as a student is being created.
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
            new_student = Student.objects.create(
                user = created_user,
                first_name = data['first_name'],
                last_name = data['last_name'],
                field_of_study = data['field_of_study'],
                university_studying_at = u
            )
            
            try:
                new_student.full_clean()
            except:
                return Response({'errorM': "An error message"}, status=status.HTTP_400_BAD_REQUEST)
            
            new_student.save()
            
            try:
                # Serialize the new model and send back to the frontend.
                serializer = StudentSerializer(new_student)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except:
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
    
@permission_classes([IsAuthenticated])
class SocietyListView(generics.ListAPIView):
    """View to retrieve list of societies"""
    
    queryset = Society.objects.all()
    serializer_class = SocietySerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'
    
    """Override the serializer class for creating the society.
        So we use the other serializers which are described on the serializer page.
    """
    def get_serializer_class(self):
        if self.request.method == 'POST':
            return SocietyCreationSerializer
        return SocietySerializer
    
    @permission_classes(AllowAny, )
    def post(self,request):
        
        auth_content = request.data.get('user')
        uni_content = request.data.get('university_society_is_at')

        # Will change this to obtain the uni via id not name as discussed.
        u = University.objects.get(name=uni_content['name'])
        
        try:
            
            # First, we create the user object, before we can actually create the society model.

            created_user = User.objects.create_user(
                email = auth_content['email'], 
                password = auth_content['password'],
                # Level 4 as its the society being created.
                user_level = 4
            )
            
        except:
            # If there is already an account with that email, we throw an error.
            return Response(status=status.HTTP_409_CONFLICT)
        
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
                university_society_is_at = u
            )
            
            try:
                new_society.full_clean()
            except:
                return Response({'errorM': "An error message"}, status=status.HTTP_400_BAD_REQUEST)
            
            new_society.save()
            
            try:
                # Serialize the new model and send back to the frontend.
                serializer = SocietySerializer(new_society)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except:
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