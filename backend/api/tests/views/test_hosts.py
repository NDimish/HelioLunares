from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse
from api.models import Hosts, User


class HostsTestCase(APITestCase):
    def login(self):
        response = self.client.post('/log_in/', {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def test_hosts_create(self):
        """create hosts """
        self.login()

        url = reverse("hosts")
        data = {
            "student_email": "justin3@gmail.com",
            "event_id": 1
        }
        response = self.client.post(url, data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Hosts.objects.count(), 1)
        self.assertEqual(Hosts.objects.get("student_email"), "justin@gmail.com")

    def test_hosts_list(self):
        """get all hosts"""
        self.login()

        # create obj first
        self.test_hosts_create()

        url = reverse("hosts")
        response = self.client.post(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)
