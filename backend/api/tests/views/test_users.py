from django.test import TestCase
from rest_framework import status
from rest_framework.test import APITestCase, RequestsClient
from rest_framework.authtoken.models import Token
from requests.auth import HTTPBasicAuth
from api.models import User


class UsersTestCase(APITestCase):

    fixtures = [
        'api/tests/fixtures/default_user.json'
    ]

    def setUp(self): 
        self.url = '/users/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.data = {}
    
    def test_url_exists(self):
        response = self.client.get(self.url, {}, format='json')
        self.assertNotEqual(response.status_code,404)
    
    def test_url_access_denied_without_authentication(self):
        response = self.client.get(self.url, {}, format='json')
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'].code,"not_authenticated")
    
    def test_url_access_allowed_with_force_authentication(self):
        self.client.force_authenticate(self.user)
        response = self.client.get(self.url, {}, format='json')
        self.assertEqual(len(response.data), 1)
    
    def test_url_access_allowed_with_api_login(self):
        response = self.client.post('/log_in/',{'email':'johndoe@example.org','password':'Password123'},format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']
        response = self.client.get(self.url, self.data, format='json')
        self.assertEqual(len(response.data), 1)
