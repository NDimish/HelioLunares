from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse

from api.models import Event, User


class EventTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_event.json',
    ]

    def setUp(self):
        self.url = '/event/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
        self.data = {
            "society": 1,
            "duration": 10,
            "event_date": "2023-02-22T00:00:00Z",
            "event_name": "football-match",
            "location": "london",
            "description": "london is very famous city",
            "price": 37.0,
            "update_time": "2023-02-27T12:56:12.921756Z",
            "create_time": "2023-02-25T11:47:06.216393Z"}

    def test_event_create(self):
        """
          Ensure we can get all the event objects.
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.post(self.url, self.data, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Event.objects.count(), 2)
        self.assertEqual(response.data.get("event_name"), "football-match")

    def test_event_get_list(self):
        """
          Ensure we can get all the event objects.

          we have two steps:1.create data 2.query data list
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        # query data list
        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) == 1)
