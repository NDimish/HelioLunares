from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User, Society


class UserWithIDTestCase(APITestCase):

    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json'
    ]

    def setUp(self): 
        self.url = '/society/3/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
    
    def test_url_exists_with_get(self):
        response = self.client.get(self.url, format='json')
        self.assertNotEqual(response.status_code,404)
    
    def test_url_access_denied_without_authentication(self):
        response = self.client.get(self.url, format='json')
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'].code,"not_authenticated")

    
    def test_url_access_allowed_with_api_login(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_url_output_with_valid_id(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data),7)

        user = User.objects.get(email='jamesdoe@example.org')
        self.assertEqual(user.email,response.data['user']['email'])
        self.assertEqual(user.id,response.data['user']['id'])
        self.assertEqual(user.user_level,response.data['user']['user_level'])

        soc = Society.objects.get(user=user)
        self.assertEqual(soc.name,response.data['name'])
        self.assertEqual(soc.about_us,response.data['about_us'])


    
    def test_url_output_with_out_of_bound_id(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get('/society/99/', format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_404_NOT_FOUND)
    
    def test_url_with_delete(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.delete('/society/3/', format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

        try:
            user = User.objects.get(email='jamesdoe@example.org')
            self.fail()
        except:
            pass
    
        try:
            soc = Society.objects.get(user_id=3)
            self.fail()
        except:
            pass