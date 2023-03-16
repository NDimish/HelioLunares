from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User


class UserWithIDTestCase(APITestCase):

    fixtures = [
        'api/tests/fixtures/default_users.json',
    ]

    def setUp(self): 
        self.url = '/users/1/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.login_data = {
            'email':'johndoe@example.org',
            'password':'Password123'
        }
    
    def test_url_exists(self):
        response = self.client.get(self.url, {}, format='json')
        self.assertNotEqual(response.status_code,404)
    
    def test_url_access_denied_without_authentication(self):
        response = self.client.get(self.url, {}, format='json')
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'].code,"not_authenticated")
    
    def test_url_access_allowed_with_api_login(self):
        response = self.client.post('/log_in/',self.login_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        self.assertEqual(len(response.data), 4)
    
    def test_url_output_with_valid_id(self):
        response = self.client.post('/log_in/',self.login_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        self.assertEqual(len(response.data), 4)
        user = User.objects.get(id=1)
        self.assertEqual(response.data['id'],user.id)
        self.assertEqual(response.data['email'],user.email)
        self.assertEqual(response.data['date_joined'],user.date_joined.isoformat())
        self.assertEqual(response.data['user_level'],user.user_level)
    
    def test_url_output_with_out_of_bound_id(self):
        response = self.client.post('/log_in/',self.login_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get('/users/99/', format='json', **header)
        self.assertEqual(response.status_code,status.HTTP_404_NOT_FOUND)