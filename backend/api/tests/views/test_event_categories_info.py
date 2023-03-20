from rest_framework import status
from rest_framework.test import APITestCase

from api.models import EventCategories


class EventCategoriesInfoTestCase(APITestCase):
    def login(self):
        response = self.client.post('/log_in/', {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def create(self):
        self.login()
        # todo
        data = {
            "societyId": 3,
            "categoryId": 3
        }
        response = self.client.post("/event_categories/", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assert_(len(response.data) > 0)
        return response.data


def test_event_categories_get_with_id(self):
    self.login()
    id = self.create().get("id")
    response = self.client.get(f"/event_categories/{id}", format="json")
    self.assertEqual(response.status_code, status.HTTP_200_OK)
    self.assert_(len(response.data) > 0)


def test_event_categories_update_with_id(self):
    self.login()
    id = self.create().get("id")
    # todo
    data = {
        "societyId": 3,
        "categoryId": 3
    }
    response = self.client.put(f"/event_categories/{id}", data=data, format="json")
    self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
    self.assertEqual(response.data["societyId"], 3)


def test_event_categories_delete_with_id(self):
    self.login()
    id = self.create().get("id")
    response = self.client.delete(f"/event_categories/{id}", format="json")
    self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
    self.assertEqual(len(EventCategories.objects.filter(id=id)), 0)
