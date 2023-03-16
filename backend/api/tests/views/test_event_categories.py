from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status

from api.models import User, EventCategories


class EventCategoriesTestCase(APITestCase):
    def setUp(self):
        self.user = User.objects.filter(email='johndoe@example.org').first()

    def login(self):
        url = reverse("log_in")
        response = self.client.post(url, {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def test_event_categories_create(self):
        """create event categories """
        self.login()

        url = reverse("event_categories")
        # todo
        data = {
            "societyId": 3,
            "categoryId": 3
        }
        response = self.client.post(url, data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(EventCategories.objects.count(), 1)
        self.assertEqual(EventCategories.objects.get("societyId"), "3")

    def test_event_categories_list(self):
        """get all event categories"""

        self.login()

        # create obj first
        self.test_event_categories_create()

        url = reverse("event_categories")
        response = self.client.post(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)
