from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User, Society, PeopleRoleAtSociety, People

class SocietyTestCase(APITestCase):

    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_people.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_peopleroleatsociety.json',
    ]

    def setUp(self): 
        self.url = '/societyrole/'
        #data to login into a valid accound userlevel 1
        self.user_data = {
            "email": "janedoe@example.org",
            'password': 'Password123'
        }
        #data to create a new society.
        self.post_data = {
            "society": 5
        }
    
    def test_people_can_join_society(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url+'join/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        people = People.objects.get(user_id=2)
        new_role = PeopleRoleAtSociety.objects.get(society=5,user_at_society=people)
        self.assertEquals(new_role.role,1)

