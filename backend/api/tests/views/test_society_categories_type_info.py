from rest_framework import status
from rest_framework.test import APITestCase

from api.models import SocietyCategoriesType


class SocietyCategoriesTypeInfoTestCase(APITestCase):
    def login(self):
        response = self.client.post('/log_in/', {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def create(self):
        self.login()
        data = {
            "student_email": "justin3@gmail.com",
            "event_id": 1
        }
        response = self.client.post("/society_categories_type/", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assert_(len(response.data) > 0)
        return response.data

    def test_society_categories_type_get_with_id(self):
        self.login()
        id = self.create().get("id")
        response = self.client.get(f"/society_categories_type/{id}", format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)

    def test_society_categories_type_update_with_id(self):
        self.login()
        id = self.create().get("id")
        data = {
            "category_name": "music concert"
        }
        response = self.client.put(f"/society_categories_type/{id}", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(response.data["category_name"], "music concert")

    def test_society_categories_type_delete_with_id(self):
        self.login()
        id = self.create().get("id")
        response = self.client.delete(f"/society_categories_type/{id}", format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(SocietyCategoriesType.objects.filter(id=id)), 0)
