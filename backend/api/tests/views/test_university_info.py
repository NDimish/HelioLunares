from rest_framework.test import APITestCase
from rest_framework import status

from api.models import University


class UniversityInfoTestCase(APITestCase):
    def test_university_get_with_id(self):
        """
        Ensure we can get university by id
        """
        url = "university/1/"
        response = self.client.get(url, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_university_update_with_id(self):
        """
        Ensure we update university by id
        """
        url = "university/1/"
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
        url = "university/1/"
        response = self.client.delete(url, format="json")
        self.assertEqual(University.objects.get(), None)
