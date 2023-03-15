from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User


class UsersTestCase(APITestCase):
    """/users/ Test cases"""
    fixtures = [
        'api/tests/fixtures/default_users.json'
    ]

    def setUp(self): 
        self.url = '/users/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email':'johndoe@example.org',
            'password':'Password123'
        }
        self.data = {}
    
    ###URLS WITH GET REQUESTS
    def test_url_exists_with_get(self):
        response = self.client.get(self.url, {}, format='json')
        self.assertNotEqual(response.status_code,404)
    
    def test_url_access_denied_without_authentication_for_get(self):
        response = self.client.get(self.url, {}, format='json')
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'].code,"not_authenticated")
    
    def test_url_access_allowed_with_api_login_for_get(self):
        response = self.client.post('/log_in/',{'email':'johndoe@example.org','password':'Password123'},format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(len(response.data), 5)
    
    def test_url_outputs_with_invalid_ordering(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType', format='json', **header)
        self.assertEqual(len(response.data), 5)
        self.assertEquals(response.data[0]['email'],'johndoe@example.org')
        self.assertEquals(response.data[1]['email'],'janedoe@example.org')
        self.assertEquals(response.data[2]['email'],'jamesdoe@example.org')
        self.assertEquals(response.data[3]['email'],'jamesondoe@example.org')
        self.assertEquals(response.data[4]['email'],'jamedoe@example.org')

    def test_url_outputs_with_valid_ordering_according_to_user_when_accending(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=email', format='json',**header)
        self.assertEqual(len(response.data), 5)
        self.assertEquals(response.data[0]['email'],'jamedoe@example.org')
        self.assertEquals(response.data[1]['email'],'jamesdoe@example.org')
        self.assertEquals(response.data[2]['email'],'jamesondoe@example.org')
        self.assertEquals(response.data[3]['email'],'janedoe@example.org')
        self.assertEquals(response.data[4]['email'],'johndoe@example.org')
    
    def test_url_outputs_with_valid_ordering_according_to_user_when_decending(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=-email', format='json',**header)
        self.assertEqual(len(response.data), 5)
        self.assertEquals(response.data[4]['email'],'jamedoe@example.org')
        self.assertEquals(response.data[3]['email'],'jamesdoe@example.org')
        self.assertEquals(response.data[2]['email'],'jamesondoe@example.org')
        self.assertEquals(response.data[1]['email'],'janedoe@example.org')
        self.assertEquals(response.data[0]['email'],'johndoe@example.org')
    
    def test_url_outputs_with_invalid_filtering_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?InvalidFilter=Invalid', format='json', **header)
        self.assertEqual(len(response.data), 5)
        self.assertEquals(response.data[0]['email'],'johndoe@example.org')
        self.assertEquals(response.data[1]['email'],'janedoe@example.org')
        self.assertEquals(response.data[2]['email'],'jamesdoe@example.org')
        self.assertEquals(response.data[3]['email'],'jamesondoe@example.org')
        self.assertEquals(response.data[4]['email'],'jamedoe@example.org')
    
    def test_url_outputs_with_valid_filtering_type_and_invalid_filter(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?email=Invalid', format='json',**header)
        self.assertEqual(len(response.data), 0)
    
    def test_url_outputs_with_valid_filtering_type_and_valid_filter(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?email=johndoe@example.org', format='json', **header)
        self.assertEqual(len(response.data), 1)
        self.assertEquals(response.data[0]['email'],'johndoe@example.org')
    
    def test_url_output_with_invalid_ordering_and_invalid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType&InvalidFilterType=Invalid', format='json', **header)
        self.assertEqual(len(response.data), 5)
        self.assertEquals(response.data[0]['email'],'johndoe@example.org')
        self.assertEquals(response.data[1]['email'],'janedoe@example.org')
        self.assertEquals(response.data[2]['email'],'jamesdoe@example.org')
        self.assertEquals(response.data[3]['email'],'jamesondoe@example.org')
        self.assertEquals(response.data[4]['email'],'jamedoe@example.org')
    
    def test_url_output_with_valid_ordering_and_invalid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=email&InvalidFilterType=Invalid', format='json', **header)
        self.assertEqual(len(response.data), 5)
        self.assertEquals(response.data[0]['email'],'jamedoe@example.org')
        self.assertEquals(response.data[1]['email'],'jamesdoe@example.org')
        self.assertEquals(response.data[2]['email'],'jamesondoe@example.org')
        self.assertEquals(response.data[3]['email'],'janedoe@example.org')
        self.assertEquals(response.data[4]['email'],'johndoe@example.org')
    
    def test_url_output_with_invalid_ordering_and_valid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType&email=jamesdoe@example.org', format='json', **header)
        self.assertEqual(len(response.data), 1)
        self.assertEquals(response.data[0]['email'],'jamesdoe@example.org')
    
    def test_url_output_with_valid_ordering_and_valid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=email&user_level=3', format='json', **header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['email'],'jamedoe@example.org')
        self.assertEquals(response.data[1]['email'],'jamesdoe@example.org')
        self.assertEquals(response.data[2]['email'],'jamesondoe@example.org')
    
    ###URLS WITH POST Requests
    def test_url_
    