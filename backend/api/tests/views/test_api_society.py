from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User, Society

class SocietyTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_people.json',
        'api/tests/fixtures/default_peopleroleatsociety.json',
        'api/tests/fixtures/default_society.json',
    ]

    def setUp(self):
        self.url = '/society/'
        self.user = User.objects.get(id=1)
        #data to login into a valid accound userlevel 1
        self.user_data = {
            "email": "johndoe@example.org",
            'password': 'Password123'
        }
        #data to create a new society.
        self.post_data = {
            "user": {
                "email": "adamdoe@example.com",
                "password": "This.4938.is.best"
            },
            "name": "Test Society",
            "creation_date": "12/12/2002",
            "university_society_is_at": 1
        }
    
    def test_url_exists_with_get(self):
        response = self.client.get(self.url, format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
    
    def test_url_access_denied__with_get_without_authentication(self):
        response = self.client.get(self.url, format='json')
        self.assertEqual(response.status_code,status.HTTP_401_UNAUTHORIZED)
        self.assertEqual(response.data['detail'].code,"not_authenticated")
    
    def test_url_access_allowed_with_api_login(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url, format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_200_OK)
    
    def test_url_outputs_valid_data(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url, format='json',**header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'], 'test_soc_one')
        self.assertEquals(response.data[1]['name'], 'test_soc_two')
        self.assertEquals(response.data[2]['name'], 'test_soc_three')

    def test_url_outputs_with_invalid_ordering(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType', format='json',**header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'], 'test_soc_one')
        self.assertEquals(response.data[1]['name'], 'test_soc_two')
        self.assertEquals(response.data[2]['name'], 'test_soc_three')

    def test_url_outputs_with_valid_ordering_according_to_user_when_accending(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=user', format='json', **header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'], 'test_soc_one')
        self.assertEquals(response.data[1]['name'], 'test_soc_two')
        self.assertEquals(response.data[2]['name'], 'test_soc_three')

    def test_url_outputs_with_valid_ordering_according_to_user_when_decending(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=-user',  format='json', **header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'], 'test_soc_three')
        self.assertEquals(response.data[1]['name'], 'test_soc_two')
        self.assertEquals(response.data[2]['name'], 'test_soc_one')

    def test_url_outputs_with_invalid_filtering_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?InvalidFilter=Invalid',  format='json', **header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'], 'test_soc_one')
        self.assertEquals(response.data[1]['name'], 'test_soc_two')
        self.assertEquals(response.data[2]['name'], 'test_soc_three')

    def test_url_outputs_with_valid_filtering_type_and_invalid_filter(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?name=Invalid',  format='json', **header)
        self.assertEqual(len(response.data), 0)

    def test_url_outputs_with_valid_filtering_type_and_valid_filter(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?name=test_soc_two',  format='json', **header)
        self.assertEqual(len(response.data), 1)
        self.assertEquals(response.data[0]['name'], 'test_soc_two')

    def test_url_output_with_invalid_ordering_and_invalid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType&InvalidFilterType=Invalid', format='json', **header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'], 'test_soc_one')
        self.assertEquals(response.data[1]['name'], 'test_soc_two')
        self.assertEquals(response.data[2]['name'], 'test_soc_three')

    def test_url_output_with_valid_ordering_and_invalid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=name&InvalidFilterType=Invalid',  format='json', **header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'], 'test_soc_one')
        self.assertEquals(response.data[1]['name'], 'test_soc_three')
        self.assertEquals(response.data[2]['name'], 'test_soc_two')

    def test_url_output_with_invalid_ordering_and_valid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=InvalidOrderingType&name=test_soc_two',  format='json', **header)
        self.assertEqual(len(response.data), 1)
        self.assertEquals(response.data[0]['name'], 'test_soc_two')

    def test_url_output_with_valid_ordering_and_valid_filter_type(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.get(self.url+'?ordering=-name&creation_date=2022-01-01', format='json', **header)
        self.assertEqual(len(response.data), 3)
        self.assertEquals(response.data[0]['name'],'test_soc_two')
        self.assertEquals(response.data[1]['name'],'test_soc_three')
        self.assertEquals(response.data[2]['name'],'test_soc_one')
    
    def test_url_with_post(self):
        response = self.client.post(self.url,format='json')
        self.assertNotEquals(response.status_code,status.HTTP_404_NOT_FOUND)
    
    def test_url_with_valid_data(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url, self.post_data, format='json', **header)
        self.assertEquals(response.status_code,status.HTTP_201_CREATED)
        #Get objects
        created_user = User.objects.get(email="adamdoe@example.com")
        self.assertEquals(created_user.email,self.post_data['user']['email'])
        self.assertEquals(created_user.id,6)
        self.assertEquals(created_user.user_level,3)

        created_soc = Society.objects.get(user_id=6)
        self.assertEquals(created_soc.name,'Test Society')
    
    def test_post_url_with_invalid_email(self):
        self.post_data['user']['email'] = "johndoe@example.org"
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url, self.post_data, format='json', **header)
        self.assertEquals(response.status_code, status.HTTP_409_CONFLICT)
    
    def test_post_url_with_invalid_password(self):
        self.post_data['user']['password'] = ".org"
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url, self.post_data, format='json', **header)
        self.assertEquals(response.status_code, status.HTTP_409_CONFLICT)
    
    def test_post_url_with_invalid_university(self):
        self.post_data['university_society_is_at'] = 99
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url, self.post_data, format='json', **header)
        self.assertEquals(response.status_code, status.HTTP_400_BAD_REQUEST)
    
    def test_post_url_with_invalid_society_name(self):
        self.post_data['name'] = "averylongnameaverylongnameaverylongnameaverylongnameaverylongnameaverylongnameaverylongnameaverylongnameaverylongnameaverylongname"
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url, self.post_data, format='json', **header)
        self.assertEquals(response.status_code, status.HTTP_400_BAD_REQUEST)
