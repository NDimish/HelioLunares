from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from api.models import EventCategoriesType, User


class EventCategoriesTypeTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_eventcategoriestype.json',
    ]

    def setUp(self):
        self.url = '/event_categories_type/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
        self.data = {
            "category_name": "sport_my"
        }

    def test_event_categories_type_create(self):
        """create eventCategoriesType """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.post(self.url, data=self.data, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data.get("category_name"), "sport_my")
        self.assertEqual(EventCategoriesType.objects.count(), 2)

    def test_event_categories_type_list(self):
        """get all event categories type"""
        response = self.client.post('/log_in/', self.user_data, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        # create obj first
        response = self.client.get(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) == 1)
