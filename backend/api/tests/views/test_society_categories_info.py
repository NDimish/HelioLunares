from rest_framework import status
from rest_framework.test import APITestCase

from api.models import SocietyCategories, User


class SocietyCategoriesInfoTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_societycategories.json',
        'api/tests/fixtures/default_societycategoriestype.json',
    ]

    def setUp(self):
        self.url = '/society_categories/1/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
        self.data = {
            "society": 1,
            "category": 1
        }

    def test_society_categories_get_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)

        response = self.client.get(self.url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data.get("society"), 1)
        self.assertEqual(response.data.get("category"), 1)

    def test_society_categories_update_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)

        response = self.client.put(self.url, data=self.data, format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(response.data.get("category"), 1)

    def test_society_categories_delete_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)

        response = self.client.delete(self.url, format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(SocietyCategories.objects.filter(id=1)), 0)
