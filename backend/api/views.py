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

from .models import User, Society, Event, University, Ticket, EventCategoriesType, EventCategories, \
    SocietyCategoriesType, SocietyCategories

from .serializers import UserSerializer, SocietySerializer, UniversitySerializer, EventModelSerializer, \
    TicketModelSerializer, EventCategoriesTypeModelSerializer, EventCategoriesModelSerializer, \
    SocietyCategoriesTypeModelSerializer, SocietyCategoriesModelSerializer

#nathan testing
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.shortcuts import render
from rest_framework import generics




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
                {'error': 'Please provide both email and password'},
                status = status.HTTP_400_BAD_REQUEST
            )
        
        user = authenticate(username=username, password=password)
    
        if not user:
            return Response(
                {'error': 'Invalid credentials'},
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
            {'token': token.key,
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
    
    def post(self,request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    

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

class SocietyListView(generics.ListAPIView):
    """View to retrieve list of societies"""
    
    queryset = Society.objects.all()
    serializer_class = SocietySerializer
    filter_backends = [DjangoFilterBackend,OrderingFilter]
    filterset_fields = '__all__'
    ordering_fields = '__all__'

    def post(self,request):
        serializer = SocietySerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

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
        university = University.objects.filter(name=pk)
        serializer = UniversitySerializer(instance=university, many=True)
        return Response(serializer.data)

    def put(self, request, pk):
        university = University.objects.filter(name=pk).first()
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


@permission_classes([IsAuthenticated])
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


@permission_classes([IsAuthenticated])
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


@permission_classes([IsAuthenticated])
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


@permission_classes([IsAuthenticated])
class EventCategoriesTypeInfoApiView(APIView):
    def get(self, request, pk):
        eventCategoriesType = EventCategoriesTypeModelSerializer.objects.filter(id=pk).first()
        serializer = EventCategoriesTypeModelSerializer(instance=eventCategoriesType)
        return Response(data=serializer.data)

    def put(self, request, pk):
        eventCategoriesType = EventCategoriesTypeModelSerializer.objects.filter(id=pk).first()
        serializer = EventCategoriesTypeModelSerializer(instance=eventCategoriesType, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        EventCategoriesType.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@permission_classes([IsAuthenticated])
class EventCategoriesApiView(APIView):
    def get(self, request):
        eventCategories = EventCategories.objects.all()
        serializer = TicketModelSerializer(instance=eventCategories, many=True)
        return Response(data=serializer.data)

    def post(self, request):
        serializer = EventCategoriesModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)


@permission_classes([IsAuthenticated])
class EventCategoriesInfoApiView(APIView):
    def get(self, request, pk):
        eventCategories = EventCategories.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=eventCategories)
        return Response(data=serializer.data)

    def put(self, request, pk):
        eventCategories = EventCategories.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=eventCategories, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        EventCategories.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@permission_classes([IsAuthenticated])
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


@permission_classes([IsAuthenticated])
class SocietyCategoriesTypeInfoApiView(APIView):
    def get(self, request, pk):
        societyCategoriesType = SocietyCategoriesType.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=societyCategoriesType)
        return Response(data=serializer.data)

    def put(self, request, pk):
        societyCategoriesType = SocietyCategoriesType.objects.filter(id=pk).first()
        serializer = TicketModelSerializer(instance=societyCategoriesType, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_204_NO_CONTENT)

    def delete(self, reuqest, pk):
        SocietyCategoriesType.objects.filter(id=pk).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@permission_classes([IsAuthenticated])
class SocietyCategoriesApiView(APIView):
    def get(self, request):
        societyCategories = SocietyCategories.objects.all()
        serializer = TicketModelSerializer(instance=societyCategories, many=True)
        return Response(data=serializer.data)

    def post(self, request):
        serializer = SocietyCategoriesModelSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)


@permission_classes([IsAuthenticated])
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