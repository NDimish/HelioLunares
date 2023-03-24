from rest_framework import status
from rest_framework.test import APITestCase

from api.models import Ticket, User


class TicketInfoTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_event.json',
        'api/tests/fixtures/default_ticket.json',
    ]

    def setUp(self):
        self.url = '/ticket/1/'
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

    def test_ticket_get_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.get(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data.get("price"), 90.9)

    def test_ticket_update_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.put(self.url, data=self.data, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(response.data.get("price"), 93.0)

    def test_ticket_delete_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.delete(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(Ticket.objects.filter(id=1)), 0)
