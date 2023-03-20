from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status

from api.models import User, Ticket


class TicketTestCase(APITestCase):
    def setUp(self):
        self.user = User.objects.filter(email='johndoe@example.org').first()

    def login(self):
        url = reverse("log_in")
        response = self.client.post(url, {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def test_ticket_create(self):
        """create ticket """
        self.login()

        url = reverse("ticket")
        data = {
            "event_id": 1,
            "user": 1,
            "date": "2023-3-15",
            "price": 90.9
        }
        response = self.client.post(url, data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Ticket.objects.count(), 1)
        self.assertEqual(Ticket.objects.get("price"), "90.9")

    def test_ticket_list(self):
        """get all ticket"""

        self.login()

        # create obj first
        self.test_ticket_create()

        url = reverse("ticket")
        response = self.client.post(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)
