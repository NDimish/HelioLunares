from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status

from api.models import User, Ticket


class TicketTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_event.json',
        'api/tests/fixtures/default_ticket.json',
    ]

    def setUp(self):
        self.url = '/ticket/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }

        self.data = {
            "event": 1,
            "user": 1,
            "date": "2023-03-15T10:00:20Z",
            "price": 93.0
        }

    def test_ticket_create(self):
        """create ticket """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.post(self.url, data=self.data, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data.get("price"), 93.0)
        self.assertEqual(Ticket.objects.count(), 2)

    def test_ticket_list(self):
        """get all ticket"""

        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.get(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
