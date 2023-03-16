from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status

from api.models import User, SocietyCategories


class SocietyCategoriesTestCase(APITestCase):
    def setUp(self):
        self.user = User.objects.filter(email='johndoe@example.org').first()

    def login(self):
        url = reverse("log_in")
        response = self.client.post(url, {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def test_society_categories_create(self):
        """create society categories """
        self.login()

        url = reverse("society_categories")
        data = {
            # todo
            "societyId": 3,
            "categoryId": 3
        }
        response = self.client.post(url, data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(SocietyCategories.objects.count(), 1)
        self.assertEqual(SocietyCategories.objects.get("societyId"), 3)

    def test_society_categories_list(self):
        """get all society categories"""

        self.login()

        # create obj first
        self.test_society_categories_create()

        url = reverse("society_categories")
        response = self.client.post(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)
