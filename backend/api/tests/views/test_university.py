from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse
from api.models import University, User


class UniversityTestCase(APITestCase):
    def login(self):
        response = self.client.post('/log_in/', {"email":"johndoe@example.org","password":"Password123"},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def test_university_get_list(self):
        """
          Ensure we can get all the event university.
        """
        self.login()
        self.test_university_create()
        url = reverse("university")
        response = self.client.get(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)

    def test_university_create(self):
        """
          Ensure we can get all the university objects.
        """
        self.login()
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
        self.assert_(len(response.data) > 0)
        self.assertEqual(University.objects.get().name, "UK Universities")
