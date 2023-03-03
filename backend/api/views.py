from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from rest_framework import status
from .models import User, Society, Event, University
from rest_framework.views import APIView
from django.contrib.auth import authenticate, login, logout
from .serializers import UserSerializer, SocietySerializer, UniversitySerializer, EventModelSerializer

#nathan testing
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.shortcuts import render
from rest_framework import generics



# Create your views here.
@api_view(['GET'])
@permission_classes([IsAuthenticated, ])
def student_sign_up(request):
    return Response({'url_link': 'under construction'})


@api_view(['GET'])
@permission_classes([IsAuthenticated, ])
def society_sign_up(request):
    return Response({'url_link': 'under construction'})


@api_view(['GET'])
def log_out(request):
    logout(request)
    return Response(data={'user_logged_out': True}, status=status.HTTP_200_OK)

class LogInView(APIView):
    """Log in view to authenticate the user."""
    authentication_classes = [SessionAuthentication, TokenAuthentication]
    permission_classes = [AllowAny, ]


    def get(self, request, format=None):
        content = {
            'user': str(request.user),  # `django.contrib.auth.User` instance.
            'auth': str(request.auth),  # None
        }
        return Response(content)


    # @csrf_exempt
    def post(self, request, format=None):
        username = request.data.get('email')
        password = request.data.get('password')

        if username is None or password is None:
            return Response(
                {'error': 'Please provide both email and password'},
                status=status.HTTP_400_BAD_REQUEST
            )

        user = authenticate(username=username, password=password)

        if not user:
            return Response(
                {'error': 'Invalid credentials'},
                status=status.HTTP_404_NOT_FOUND
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
             'is_authenticated': user.is_authenticated
             },
            status=status.HTTP_200_OK
        )


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user_list(request, format=None):
    users = User.objects.all()
    serializer = UserSerializer(users, many=True)
    return Response(serializer.data)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user_with_id(request, pk):
    try:
        user = User.objects.get(id=pk)
        serializer = UserSerializer(user)
        return Response(serializer.data)
    except:
        return Response({'error': 'User not found.'}, status=status.HTTP_404_NOT_FOUND)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_society_list(request, format=None):
    soc = Society.objects.all()
    serializer = SocietySerializer(soc, many=True)
    return Response(serializer.data)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_society_with_id(request, pk):
    try:
        soc = Society.objects.get(id=pk)
        serializer = SocietySerializer(soc)
        return Response(serializer.data)
    except:
        return Response({'error': 'Society not found.'}, status=status.HTTP_404_NOT_FOUND)


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


@permission_classes([IsAuthenticated])
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
    

    #testing

@csrf_exempt
def user_list(request):

    if request.method == 'GET':
        user = User.objects.all()
        serializer = UserSerializer(user, many=True)
        return JsonResponse(serializer.data, safe=False)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = UserSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)

@csrf_exempt
def user_detail(request, pk):
    """
    Retrieve, update or delete a code user.
    """
    try:
        user = User.objects.get(pk=pk)
    except User.DoesNotExist:
        return HttpResponse(status=404)

    if request.method == 'GET':
        serializer = UserSerializer(user)
        return JsonResponse(serializer.data)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = UserSerializer(user, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        return JsonResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        user.delete()
        return HttpResponse(status=204)



#testing
class userData(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class EventData(generics.ListCreateAPIView):
    queryset = Event.objects.all()
    serializer_class = EventModelSerializer

