from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from api.models import EventCategoriesType


class EventCategoriesTypeTestCase(APITestCase):
    def login(self):
        response = self.client.post('/log_in/', {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def test_event_categories_type_create(self):
        """create eventCategoriesType """
        self.login()

        url = reverse("event_categories_type")
        data = {
            "category_name": "sport"
        }
        response = self.client.post(url, data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(EventCategoriesType.objects.count(), 1)
        self.assertEqual(EventCategoriesType.objects.get("category_name"), "sport")

    def test_event_categories_type_list(self):
        """get all eventCategoriesType"""
        self.login()

        # create obj first
        self.test_event_categories_type_create()

        url = reverse("event_categories_type")
        response = self.client.post(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)
