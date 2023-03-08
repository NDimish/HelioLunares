from rest_framework.test import APITestCase
from rest_framework import status

from api.models import Buys, User


class BuysTestCase(APITestCase):
    def setUp(self):
        self.user = User.objects.filter(email='johndoe@example.org').first()


    def login(self):
        response = self.client.post('/log_in/', {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def create(self):
        self.login()
        data = {
            "number_of_tickets": 2,
            "student_email": "justin@gmail.com",
            "event_id": 1
        }
        response = self.client.post("/buys/", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assert_(len(response.data) > 0)
        return response.data

    def test_buys_get_with_id(self):
        self.login()
        id = self.create().get("id")
        response = self.client.get(f"/buys/{id}", format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)

    def test_buys_update_witd_id(self):
        self.login()
        id = self.create().get("id")
        data = {
            "number_of_tickets": 2,
            "student_email": "justin002@gmail.com",
            "event_id": 1
        }
        response = self.client.put(f"/buys/{id}", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(response.data["student_email"], "justin002@gmail.com")

    def test_buys_delete_with_id(self):
        self.login()
        id = self.create().get("id")
        response = self.client.delete(f"/buys/{id}", format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(Buys.objects.filter(id=id)), 0)
