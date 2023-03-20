from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse
from api.models import University, User


class UniversityInfoTestCase(APITestCase):
    def login(self):
        response = self.client.post('/log_in/',  {"email":"johndoe@example.org","password":"Password123"},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']


    def create(self):
        self.login()
        url = reverse("university")
        data = {
            "name": "UK Universities",
            "latitude": 80.0,
            "longitude": 7.0,
            "street_name": "UK Universities street",
            "postcode": "1003002"
        }
        response = self.client.post(url, data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assert_(len(response.data) > 0)
        return response.data

    def test_university_get_with_id(self):
        """
        Ensure we can get university by id
        """
        self.login()
        id = self.create().get("id")
        url = f"university/{id}/"
        response = self.client.get(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_university_update_with_id(self):
        """
        Ensure we update university by id
        """
        self.login()
        id = self.create().get("id")
        url = f"university/{id}/"
        data = {
            "name": "UK Universities",
            "latitude": 80.0,
            "longitude": 7.0,
            "street_name": "UK Universities street",
            "postcode": "1003002"
        }
        response = self.client.put(url, data, format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(University.objects.get().latitude, "80.0")

    def test_university_delete_with_id(self):
        """
        Ensure we delete university by id
        """
        self.login()
        id = self.create().get("id")
        url = f"university/{id}/"
        response = self.client.delete(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(University.objects.filter(id=id)), 0)
