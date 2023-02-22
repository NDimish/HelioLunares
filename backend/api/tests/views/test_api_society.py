from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User ,Society

class SocietyTestCase(APITestCase):

    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
    ]

    def setUp(self): 
        self.url = '/society/'
        self.user_data = {
            "email": "johndoe@example.org",
            'password': 'Password123'
        }
        self.user = User.objects.get(id=1)
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
        self.assertEqual(len(response.data), 3)
    
    def test_url_access_allowed_with_api_login(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
        response = self.client.get(self.url, self.data, format='json')
        self.assertEqual(len(response.data), 3)
    
    def test_url_outputs_valid_data(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
        response = self.client.get(self.url, self.data, format='json')
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'],'test_soc_one')
        self.assertEquals(response.data[1]['name'],'test_soc_two')
        self.assertEquals(response.data[2]['name'],'test_soc_three')
    
    def test_url_outputs_with_invalid_ordering(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
        response = self.client.get(self.url+'?ordering=InvalidOrderingType', self.data, format='json')
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'],'test_soc_one')
        self.assertEquals(response.data[1]['name'],'test_soc_two')
        self.assertEquals(response.data[2]['name'],'test_soc_three')

    def test_url_outputs_with_valid_ordering_according_to_user_when_accending(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
        response = self.client.get(self.url+'?ordering=user', self.data, format='json')
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'],'test_soc_one')
        self.assertEquals(response.data[1]['name'],'test_soc_two')
        self.assertEquals(response.data[2]['name'],'test_soc_three')
    
    def test_url_outputs_with_valid_ordering_according_to_user_when_decending(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
        response = self.client.get(self.url+'?ordering=-user', self.data, format='json')
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'],'test_soc_three')
        self.assertEquals(response.data[1]['name'],'test_soc_two')
        self.assertEquals(response.data[2]['name'],'test_soc_one')