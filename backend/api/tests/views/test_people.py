from rest_framework import status
from rest_framework.test import APITestCase


class PeopleTestCase(APITestCase):
    """/users/ Test cases"""
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_people.json',
    ]

    def setUp(self): 
        self.url = '/people/'
        
        #data to login into a valid accound userlevel 1
        self.user_data = {
            'email':'johndoe@example.org',
            'password':'Password123'
        }
        
    ###URLS WITH GET REQUESTS
    def test_url_exists_with_get(self):
        response = self.client.get(self.url, format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
    
    def test_url_access_denied_without_authentication_for_get(self):
        response = self.client.get(self.url, format='json')
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'].code,"not_authenticated")
    
    def test_url_access_allowed_with_api_login_for_get(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
    
    def test_url_outputs_with_invalid_ordering(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType', format='json', **header)
        self.assertEqual(len(response.data), 2)
        self.assertEquals(response.data[0]['first_name'],'John')
        self.assertEquals(response.data[1]['first_name'],'Jane')

    def test_url_outputs_with_valid_ordering_according_to_name_when_accending(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=first_name', format='json',**header)
        self.assertEqual(len(response.data), 2)
        self.assertEquals(response.data[0]['first_name'],'Jane')
        self.assertEquals(response.data[1]['first_name'],'John')
    
    def test_url_outputs_with_valid_ordering_according_to_name_when_decending(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=-first_name', format='json',**header)
        self.assertEqual(len(response.data), 2)
        self.assertEquals(response.data[0]['first_name'],'John')
        self.assertEquals(response.data[1]['first_name'],'Jane')
    
    def test_url_outputs_with_invalid_filtering_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?InvalidFilter=Invalid', format='json', **header)
        self.assertEqual(len(response.data), 2)
        self.assertEquals(response.data[0]['first_name'],'John')
        self.assertEquals(response.data[1]['first_name'],'Jane')
    
    def test_url_outputs_with_valid_filtering_type_and_invalid_filter(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?first_name=Invalid', format='json',**header)
        self.assertEqual(len(response.data), 0)
    
    def test_url_outputs_with_valid_filtering_type_and_valid_filter(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?first_name=Jane', format='json', **header)
        self.assertEqual(len(response.data), 1)
        self.assertEquals(response.data[0]['first_name'],'Jane')
    
    def test_url_output_with_invalid_ordering_and_invalid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType&InvalidFilterType=Invalid', format='json', **header)
        self.assertEqual(len(response.data), 2)
        self.assertEquals(response.data[0]['first_name'],'John')
        self.assertEquals(response.data[1]['first_name'],'Jane')
    
    def test_url_output_with_valid_ordering_and_invalid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=first_name&InvalidFilterType=Invalid', format='json', **header)
        self.assertEqual(len(response.data), 2)
        self.assertEquals(response.data[0]['first_name'],'Jane')
        self.assertEquals(response.data[1]['first_name'],'John')
    
    def test_url_output_with_invalid_ordering_and_valid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType&first_name=John', format='json', **header)
        self.assertEqual(len(response.data), 1)
        self.assertEquals(response.data[0]['first_name'],'John')
    
    def test_url_output_with_valid_ordering_and_valid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=first_name&first_name=Jane', format='json', **header)
        self.assertEqual(len(response.data), 1)
        self.assertEquals(response.data[0]['first_name'],'Jane')