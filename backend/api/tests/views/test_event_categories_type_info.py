from rest_framework import status
from rest_framework.test import APITestCase

from api.models import EventCategoriesType


class EventCategoriesTypeInfoTestCase(APITestCase):
    def login(self):
        response = self.client.post('/log_in/', {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def create(self):
        self.login()
        data = {
            "category_name": "sport"
        }
        response = self.client.post("/event_categories_type/", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assert_(len(response.data) > 0)
        return response.data

    def test_event_categories_type_get_with_id(self):
        self.login()
        id = self.create().get("id")
        response = self.client.get(f"/event_categories_type/{id}", format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)

    def test_event_categories_type_update_with_id(self):
        self.login()
        id = self.create().get("id")
        data = {
            "category_name": "sport01"
        }
        response = self.client.put(f"/event_categories_type/{id}", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(response.data["student_email"], "justin1@gmail.com")

    def test_event_categories_type_delete_with_id(self):
        self.login()
        id = self.create().get("id")
        response = self.client.delete(f"/event_categories_type/{id}", format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(EventCategoriesType.objects.filter(id=id)), 0)
