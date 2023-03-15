from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User, People


class UsersTestCase(APITestCase):
    """/users/ Test cases"""
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json'
    ]

    def setUp(self): 
        self.url = '/users/'
        self.user = User.objects.get(email='johndoe@example.org')
        #data to login into a valid accound userlevel 1
        self.user_data = {
            'email':'johndoe@example.org',
            'password':'Password123'
        }
        #data to create a user of user level 1
        self.post_data = {
            "user": {
                "email": "adamdoe@example.com",
                "password": "This.4938.is.best"
            },
            "university_studying_at" : 1,
            "first_name": "Adam",
            "last_name": "Doe",
            "field_of_study": "Chemistry"
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
    def test_url_exists_with_post(self):
        response = self.client.post(self.url, {}, format='json')
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
    
    def test_url_access_allowed_without_authentication_for_post(self):
        response = self.client.post(self.url, {}, format='json')
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{"error": "University not found"})
    
    def test_url_with_valid_post_data(self):
        response = self.client.post(self.url, self.post_data, format='json')
        
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        #find created user
        new_user = User.objects.get(email="adamdoe@example.com")
        self.assertEqual(new_user.id, 6)
        self.assertEqual(new_user.email, self.post_data["user"]["email"])
        self.assertEqual(new_user.user_level, 1)

        #Check it is created in people model
        new_people = People.objects.get(user=new_user.id)
        self.assertEqual(new_people.university_studying_at.id, self.post_data["university_studying_at"])
        self.assertEqual(new_people.first_name, self.post_data["first_name"])
        self.assertEqual(new_people.last_name, self.post_data["last_name"])
        self.assertEqual(new_people.field_of_study, self.post_data["field_of_study"])
    
    def test_url_with_invalid_university_data(self):
        self.post_data["university_studying_at"] = 10
        response = self.client.post(self.url, self.post_data, format='json')
        
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        #find created user

        try:
            User.objects.get(email="adamdoe@example.com")
        except User.DoesNotExist:
            return True
        self.assertFail()
    
    def test_url_with_invalid_first_name_data(self):
        self.post_data["first_name"] = ""
        response = self.client.post(self.url, self.post_data, format='json')
        
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        
        #Check if user is not created
        try:
            User.objects.get(email="adamdoe@example.com")
        except User.DoesNotExist:
            return True
        self.assertFail()
    
    def test_url_with_invalid_last_name_data(self):
        self.post_data["last_name"] = ""
        response = self.client.post(self.url, self.post_data, format='json')
        
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        #find created user

        try:
            User.objects.get(email="adamdoe@example.com")
        except User.DoesNotExist:
            return True
        self.assertFail()

    def test_url_with_invalid_field_of_study_data(self):
        self.post_data["field_of_study"] = ""
        response = self.client.post(self.url, self.post_data, format='json')
        
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        #find created user

        try:
            User.objects.get(email="adamdoe@example.com")
        except User.DoesNotExist:
            return True
        self.assertFail()
    
    def test_url_with_invalid_email_data(self):
        self.post_data["user"]["email"] = ""
        response = self.client.post(self.url, self.post_data, format='json')
        self.assertEqual(response.status_code,status.HTTP_409_CONFLICT)
        #find created user

        try:
            User.objects.get(email="adamdoe@example.com")
        except User.DoesNotExist:
            return True
        self.assertFail()
    
    def test_url_with_invalid_password_data(self):
        self.post_data["user"]["password"] = ""
        response = self.client.post(self.url, self.post_data, format='json')
        self.assertEqual(response.status_code,status.HTTP_409_CONFLICT)
        #find created user

        try:
            User.objects.get(email="adamdoe@example.com")
        except User.DoesNotExist:
            return True
        self.assertFail()

    