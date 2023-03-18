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

from .models import User, Society, Event, University, Ticket, EventCategoriesType, EventCategories,Student, \
    SocietyCategoriesType, SocietyCategories

from .serializers import UserSerializer, SocietySerializer, UniversitySerializer, EventModelSerializer, \
    TicketModelSerializer, EventCategoriesTypeModelSerializer, EventCategoriesModelSerializer, \
    SocietyCategoriesTypeModelSerializer, SocietyCategoriesModelSerializer,SocietyCreationSerializer,StudentSerializer,StudentCreationSerializer


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
        obj = request.data
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
class EventApiView(APIView):
    def post(self, request):
        serializer = EventModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def get(self, request):
        events = Event.objects.all()
        serializer = EventModelSerializer(instance=events, many=True)
        return Response(serializer.data)


# @permission_classes([IsAuthenticated])
class EventApiInfoView(APIView):
    def get(self, request, pk):
        event = Event.objects.filter(id=pk).first()
        serializer = EventModelSerializer(instance=event)
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

    # @api_view(['GET'])


# # @permission_classes([IsAuthenticated])
# def get_event_with_id(request, pk):
#     """query event by primary key (id)"""
#
#     events = Event.objects.all()
#     event = Event.objects.get(id=pk)
#     if event:
#         serializer = EventModelSerializer(event)
#         return Response(serializer.data)
#     else:
#         return Response({'error': 'Event not found.'},
#                         status=status.HTTP_404_NOT_FOUND)

#
# @api_view(['GET'])
# # @permission_classes([IsAuthenticated])
# def get_event_list(request):
#     """query all event objects"""
#     events = Event.objects.all()
#     serializer = EventModelSerializer(events, many=True)
#     return Response(serializer.data)
#
#
# @api_view(['POST'])
# # @permission_classes([IsAuthenticated])
# def add_event(request):
#     """add event"""
#     data = JSONParser().parse(request)
#     serializer = EventModelSerializer(data=data)
#     if serializer.is_valid():
#         serializer.save()
#         return Response(serializer.data)
#     return Response({'error': 'Illegal data'},
#                     status=status.HTTP_400_BAD_REQUEST)

# @api_view(['POST'])
# # @permission_classes([IsAuthenticated])
# def modify_event(request, pk):
#     """modify event"""
#     event = Event.objects.get(id=pk)
#     data = JSONParser().parse(request)
#     serializer = EventModelSerializer(event, data=data)
#     if serializer.is_valid():
#         serializer.save()
#         return Response(serializer.data)
#     return Response(
#         {'error': 'Illegal data'},
#         status=status.HTTP_400_BAD_REQUEST
#     )


# @api_view(['GET'])
# # @permission_classes([IsAuthenticated])
# def delete_event(pk):
#     """delete event"""
#     event = Event.objects.get(id=pk)
#     if event is not None:
#         event.delete()
#         return Response(
#             {'ok': 'Successful operation'},
#             status=status.HTTP_200_OK
#         )
#     else:
#         return Response(
#             {'error': 'Illegal data'},
#             status=status.HTTP_400_BAD_REQUEST
#         )


# @permission_classes([IsAuthenticated])
class UniversityApiView(APIView):
    def get(self, request):
        university = University.objects.all()
        serializer = UniversitySerializer(instance=university, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = UniversitySerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)


# @permission_classes([IsAuthenticated])
class UniversityInfoApiView(APIView):
    def get(self, request, pk):
        university = University.objects.filter(id=pk).first()
        serializer = UniversitySerializer(instance=university)
        return Response(serializer.data)

    def put(self, request, pk):
        university = University.objects.filter(id=pk).first()
        request.data["name"] = pk
        serializer = UniversitySerializer(instance=university, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, request, pk):
        University.objects.filter(name=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# @api_view(['GET'])
# # @permission_classes([IsAuthenticated])
# def get_university_with_id(pk):
#     university = University.objects.get(id=pk)
#     if university is not None:
#         serializer = UniversitySerializer(university)
#         return Response(serializer.data)
#     else:
#         return Response({'error': 'Event not found.'},
#                         status=status.HTTP_404_NOT_FOUND)


#
# @api_view(['GET'])
# # @permission_classes([IsAuthenticated])
# def get_university_list():
#     university = University.objects.all()
#     serializer = UniversitySerializer(university, many=True)
#     return Response(serializer.data)
#
#
# @api_view(['POST'])
# # @permission_classes([IsAuthenticated])
# def modify_university(request, pk):
#     university = University.objects.get(id=pk)
#     data = JSONParser().parse(request)
#     serializer = UniversitySerializer(university, data=data)
#     if serializer.is_valid():
#         serializer.save()
#         return Response(serializer.data)
#     return Response({'error': 'Illegal data'}, status=status.HTTP_400_BAD_REQUEST)
#
#
# @api_view(['GET'])
# # @permission_classes([IsAuthenticated])
# def delete_university(pk):
#     university = Event.objects.get(id=pk)
#     if university is not None:
#         university.delete()
#         return Response(
#             {'ok': 'Successful operation'},
#             status=status.HTTP_200_OK
#         )
#     else:
#         return Response({'error': 'Illegal data'}, status=status.HTTP_400_BAD_REQUEST)

# @permission_classes([IsAuthenticated])

# class BuysApiView(APIView):
#     def get(self, request):
#         buyses = Buys.objects.all()
#         serializer = BuysModelSerializer(instance=buyses, many=True)
#         return Response(data=serializer.data)
#
#     def post(self, request):
#         data = request.data
#         serializer = BuysModelSerializer(data=data)
#         serializer.is_valid(raise_exception=True)
#         serializer.save()
#         return Response(data=serializer.data, status=status.HTTP_201_CREATED)
#
#
# # @permission_classes([IsAuthenticated])
# class BuysApiInfoView(APIView):
#     def get(self, request, pk):
#         buy = Buys.objects.filter(id=pk).first()
#         serializer = BuysModelSerializer(instance=buy)
#         return Response(serializer.data)
#
#     def put(self, request, pk):
#         buy = Buys.objects.filter(id=pk).first()
#         serializer = BuysModelSerializer(instance=buy, data=request.data, many=False)
#         serializer.is_valid(raise_exception=True)
#         serializer.save()
#         return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)
#
#     def delete(self, request, pk):
#         Buys.objects.filter(id=pk).delete()
#         return Response(status=status.HTTP_204_NO_CONTENT)
#
#
# # @permission_classes([IsAuthenticated])
# class HostsApiView(APIView):
#     def get(self, request):
#         hosts = Hosts.objects.all()
#         serializer = HostsModelSerializer(instance=hosts, many=True)
#         return Response(data=serializer.data)
#
#     def post(self, request):
#         serializer = HostsModelSerializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         serializer.save()
#         return Response(data=serializer.data, status=status.HTTP_201_CREATED)
#
#
# # @permission_classes([IsAuthenticated])
# class HostsInfoApiView(APIView):
#     def get(self, request, pk):
#         host = Hosts.objects.filter(id=pk).first()
#         serializer = HostsModelSerializer(instance=host)
#         return Response(data=serializer.data)
#
#     def put(self, request, pk):
#         host = Hosts.objects.filter(id=pk).first()
#         serializer = HostsModelSerializer(instance=host, data=request.data)
#         serializer.is_valid(raise_exception=True)
#         serializer.save()
#         return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)
#
#     def delete(self, reuqest, pk):
#         Hosts.objects.filter(id=pk).delete()
#         return Response(status=status.HTTP_204_NO_CONTENT)


# @permission_classes([IsAuthenticated])
class TicketApiView(APIView):
    def get(self, request):
        ticket = Ticket.objects.all()
        serializer = TicketModelSerializer(instance=ticket, many=True)
        return Response(data=serializer.data)

    def post(self, request):
        serializer = TicketModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)


# @permission_classes([IsAuthenticated])
class TicketInfoApiView(APIView):
    def get(self, request, pk):
        ticket = Ticket.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=ticket)
        return Response(data=serializer.data)

    def put(self, request, pk):
        ticket = Ticket.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=ticket, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, request, pk):
        Ticket.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# @permission_classes([IsAuthenticated])
class EventCategoriesTypeApiView(APIView):
    def get(self, request):
        eventCategoriesType = EventCategoriesType.objects.all()
        serializer = EventCategoriesTypeModelSerializer(instance=eventCategoriesType, many=True)
        return Response(data=serializer.data)

    def post(self, request):
        serializer = EventCategoriesTypeModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)


# @permission_classes([IsAuthenticated])
class EventCategoriesTypeInfoApiView(APIView):
    def get(self, request, pk):
        eventCategoriesType = EventCategoriesType.objects.filter(id=pk).first()
        serializer = EventCategoriesTypeModelSerializer(instance=eventCategoriesType)
        return Response(data=serializer.data)

    def put(self, request, pk):
        eventCategoriesType = EventCategoriesType.objects.filter(id=pk).first()
        serializer = EventCategoriesTypeModelSerializer(instance=eventCategoriesType, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, request, pk):
        EventCategoriesType.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# @permission_classes([IsAuthenticated])
class EventCategoriesApiView(APIView):
    def get(self, request):
        eventCategories = EventCategories.objects.all()
        serializer = EventCategoriesModelSerializer(instance=eventCategories, many=True)
        return Response(data=serializer.data)

    def post(self, request):
        serializer = EventCategoriesModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)


# @permission_classes([IsAuthenticated])
class EventCategoriesInfoApiView(APIView):
    def get(self, request, pk):
        eventCategories = EventCategories.objects.filter(id=pk).first()
        serializer = EventCategoriesModelSerializer(instance=eventCategories)
        return Response(data=serializer.data)

    def put(self, request, pk):
        eventCategories = EventCategories.objects.filter(id=pk).first()
        serializer = EventCategoriesModelSerializer(instance=eventCategories, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, request, pk):
        EventCategories.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# @permission_classes([IsAuthenticated])
class SocietyCategoriesTypeApiView(APIView):
    def get(self, request):
        societyCategoriesType = SocietyCategoriesType.objects.all()
        serializer = SocietyCategoriesTypeModelSerializer(instance=societyCategoriesType, many=True)
        return Response(data=serializer.data)

    def post(self, request):
        serializer = SocietyCategoriesTypeModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)


# @permission_classes([IsAuthenticated])
class SocietyCategoriesTypeInfoApiView(APIView):
    def get(self, request, pk):
        societyCategoriesType = SocietyCategoriesType.objects.filter(id=pk).first()
        serializer = SocietyCategoriesTypeModelSerializer(instance=societyCategoriesType)
        return Response(data=serializer.data)

    def put(self, request, pk):
        societyCategoriesType = SocietyCategoriesType.objects.filter(id=pk).first()
        serializer = SocietyCategoriesTypeModelSerializer(instance=societyCategoriesType, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        SocietyCategoriesType.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# @permission_classes([IsAuthenticated])
class SocietyCategoriesApiView(APIView):
    def get(self, request):
        societyCategories = SocietyCategories.objects.all()
        serializer = SocietyCategoriesModelSerializer(instance=societyCategories, many=True)
        return Response(data=serializer.data)

    def post(self, request):
        serializer = SocietyCategoriesModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)


# @permission_classes([IsAuthenticated])
class SocietyCategoriesInfoApiView(APIView):
    def get(self, request, pk):
        societyCategories = SocietyCategories.objects.filter(id=pk).first()
        serializer = SocietyCategoriesModelSerializer(instance=societyCategories)
        return Response(data=serializer.data)

    def put(self, request, pk):
        societyCategories = SocietyCategories.objects.filter(id=pk).first()
        serializer = SocietyCategoriesModelSerializer(instance=societyCategories, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        SocietyCategories.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
