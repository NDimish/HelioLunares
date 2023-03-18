from rest_framework.test import APITestCase
from rest_framework import status

from api.models import User, SocietyCategoriesType


class SocietyCategoriesTypeTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_societycategoriestype.json',
    ]

    def setUp(self):
        self.url = '/society_categories_type/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
        self.data = {
            "category_name": "music concert01"
        }

    def test_society_categories_type_create(self):
        """create society categories type """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)

        response = self.client.post(self.url, data=self.data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data.get("category_name"), "music concert01")
        self.assertEqual(SocietyCategoriesType.objects.count(), 2)

    def test_societyCategoriesType_list(self):
        """get all society categories type"""

        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)

        # create obj first
        self.test_society_categories_type_create()

        response = self.client.get(self.url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 2)
