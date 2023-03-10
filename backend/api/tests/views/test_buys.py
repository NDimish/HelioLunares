from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status

from api.models import Buys, User


class BuysTestCase(APITestCase):
    def setUp(self):
        self.user = User.objects.filter(email='johndoe@example.org').first()

    def login(self):
        url = reverse("log_in")
        response = self.client.post(url, {"email":"johndoe@example.org","password":"Password123"},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def test_buys_create(self):
        """create buys """
        self.login()

        url = reverse("buys")
        data = {
            "number_of_tickets": 2,
            "student_email": "justin@gmail.com",
            "event_id": 1
        }
        response = self.client.post(url, data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Buys.objects.count(), 1)
        self.assertEqual(Buys.objects.get("student_email"), "justin@gmail.com")

    def test_buys_list(self):
        """get all buys"""

        self.login()

        # create obj first
        self.test_buys_create()

        url = reverse("buys")
        response = self.client.post(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)
