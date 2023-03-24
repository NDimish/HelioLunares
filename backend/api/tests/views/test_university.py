from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse
from api.models import University, User


class UniversityTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
    ]

    def setUp(self):
        self.url = '/university/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }

        self.data = {
            "name": "UK Universities",
            "latitude": 50.0,
            "longitude": 7.0,
            "street_name": "London Universities street",
            "postcode": "1003002"
        }

    def test_university_get_list(self):
        """
          Ensure we can get all the event university.
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.get(self.url, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 2)

    def test_university_create(self):
        """
          Ensure we can get all the university objects.
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.post(self.url, self.data, format='json', **header)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data.get("street_name"), "London Universities street")
        self.assertEqual(University.objects.count(), 3)
