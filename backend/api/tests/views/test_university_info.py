from rest_framework.test import APITestCase
from rest_framework import status
from api.models import University, User


class UniversityInfoTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
    ]

    def setUp(self):
        self.url = '/university/1/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }

        self.data = {
            "name": "UK Universities",
            "latitude": 50.0,
            "longitude": 7.0,
            "street_name": "London Universities street",
            "postcode": "1003002"
        }

    def test_university_get_with_id(self):
        """
        Ensure we can get university by id
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.get(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data["street_name"], "test street")

    def test_university_update_with_id(self):
        """
        Ensure we update university by id
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.put(self.url, self.data, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(response.data.get("street_name"), "London Universities street")

    def test_university_delete_with_id(self):
        """
        Ensure we delete university by id
        """
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.delete(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(University.objects.filter(id=1)), 0)
