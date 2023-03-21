from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status

from api.models import User, EventCategories


class EventCategoriesTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_eventcategoriestype.json',
        'api/tests/fixtures/default_eventcategories.json',
    ]

    def setUp(self):
        self.url = '/event_categories/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
        self.data = {
            "society": 1,
            "category": 1
        }

    def test_event_categories_create(self):
        """create event categories """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.post(self.url, data=self.data, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(EventCategories.objects.count(), 2)

    def test_event_categories_list(self):
        """get all event categories"""
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.get(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) == 1)
