from rest_framework import status
from rest_framework.test import APITestCase

from api.models import Event, User


class EventInfoTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_event.json',
    ]

    def setUp(self):
        self.url = '/event/1/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
        self.data = {
            "society": 1,
            "duration": 10,
            "event_date": "2023-02-22T00:00:00Z",
            "event_name": "football-match0001",
            "location": "london",
            "description": "london is very famous city",
            "price": 37.0,
            "update_time": "2023-02-27T12:56:12.921756Z",
            "create_time": "2023-02-25T11:47:06.216393Z"}

    def test_event_get_with_id(self):
        """
          Ensure we can get the event by id.
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data.get("event_name"), "football-match")

    def test_event_update_with_id(self):
        """
           Ensure we can update the event by id.
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.put(self.url, self.data, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data["event_name"], "football-match0001")

    def test_event_delete_with_id(self):
        """
           Ensure we can delete the event by id.
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.delete(self.url, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        obj = Event.objects.filter(id=1)
        self.assertEqual(len(obj), 0)
