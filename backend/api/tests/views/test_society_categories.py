from rest_framework.test import APITestCase
from rest_framework import status

from api.models import User, SocietyCategories


class SocietyCategoriesTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_societycategories.json',
        'api/tests/fixtures/default_societycategoriestype.json',
    ]

    def setUp(self):
        self.url = '/society_categories/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
        self.data = {
            "society": 1,
            "category": 1
        }

    def test_society_categories_create(self):
        """create society categories """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)

        response = self.client.post(self.url, data=self.data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data.get("society"), 1)
        self.assertEqual(SocietyCategories.objects.count(), 2)

    def test_society_categories_list(self):
        """get all society categories"""
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)

        response = self.client.get(self.url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
