from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse
from api.models import University


class UniversityTestCase(APITestCase):
    def test_university_get_list(self):
        """
          Ensure we can get all the event university.
        """
        url = reverse("event")
        response = self.client.get(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_university_create(self):
        """
          Ensure we can get all the university objects.
        """
        url = reverse("university")
        data = {
            "name": "UK Universities",
            "latitude": 50.0,
            "longitude": 7.0,
            "street_name": "UK Universities street",
            "postcode": "1003002"
        }
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(University.objects.count(), 1)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(University.objects.get().name, "UK Universities")
