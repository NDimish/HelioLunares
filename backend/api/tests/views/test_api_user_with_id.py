from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User


class UserWithIDTestCase(APITestCase):

    fixtures = [
        'api/tests/fixtures/default_users.json'
    ]

    def setUp(self): 
        self.url = '/users/1/'
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
        self.assertEqual(len(response.data), 2)
    
    def test_url_access_allowed_with_api_login(self):
        response = self.client.post('/log_in/',{'email':'johndoe@example.org','password':'Password123'},format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']
        response = self.client.get(self.url, self.data, format='json')
        print(response)
        self.assertEqual(len(response.data), 2)
    
    def test_url_output_with_valid_id(self):
        response = self.client.post('/log_in/',{'email':'johndoe@example.org','password':'Password123'},format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']
        response = self.client.get(self.url, self.data, format='json')
        self.assertEqual(len(response.data), 2)
        self.assertEqual(response.data['id'],1)