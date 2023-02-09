from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.authentication import TokenAuthentication, SessionAuthentication

from rest_framework import status
from .models import User
from rest_framework.views import APIView

from django.contrib.auth import authenticate, login, logout

from .serializers import UserSerializer

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
                {'error': 'Please provide both email and password'},
                status = status.HTTP_400_BAD_REQUEST
            )
        
        user = authenticate(username=username,password=password)
    
        if not user:
            return Response(
                {'error': 'Invalid credentials'},
                status = status.HTTP_404_NOT_FOUND
            )
        
        token, _ = Token.objects.get_or_create(user=user)
        login(request, user)
        
        if user.is_authenticated:
            print("TRUE --- USER IS LOGGED IN")
       
        print({'token': token.key,
            'email': user.email,
            'is_authenticated' : user.is_authenticated
            })
        
        return Response(
            {'token': token.key,
            'email': user.email,
            'is_authenticated' : user.is_authenticated
            },
            status = status.HTTP_200_OK
        )

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user_list(request, format=None):
    users = User.objects.all()
    serializer = UserSerializer(users, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user_with_id(request,pk):
    try:
        user = User.objects.get(id=pk)
        serializer = UserSerializer(user)
        return Response(serializer.data)
    except:
        return Response({'error':'User not found.'},status=status.HTTP_404_NOT_FOUND)