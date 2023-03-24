from rest_framework import status
from rest_framework.test import APITestCase

from api.models import EventCategoriesType, User


class EventCategoriesTypeInfoTestCase(APITestCase):
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_eventcategoriestype.json',
    ]

    def setUp(self):
        self.url = '/event_categories_type/1/'
        self.user = User.objects.get(email='johndoe@example.org')
        self.user_data = {
            'email': 'johndoe@example.org',
            'password': 'Password123'
        }
        self.data = {
            "category_name": "sport_your"
        }

    def test_event_categories_type_get_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.get(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data.get("category_name"), "sport")

    def test_event_categories_type_update_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.put(self.url, data=self.data, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(response.data.get("category_name"), "sport_your")

    def test_event_categories_type_delete_with_id(self):
        response = self.client.post('/log_in/', self.user_data, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}

        response = self.client.delete(self.url, format="json", **header)
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(EventCategoriesType.objects.filter(id=1)), 0)
