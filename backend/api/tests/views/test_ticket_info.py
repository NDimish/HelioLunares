from rest_framework import status
from rest_framework.test import APITestCase

from api.models import Ticket


class TicketInfoTestCase(APITestCase):
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
        response = self.client.post("/ticket/", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assert_(len(response.data) > 0)
        return response.data

    def test_ticket_get_with_id(self):
        self.login()
        id = self.create().get("id")
        response = self.client.get(f"/ticket/{id}", format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)

    def test_ticket_update_with_id(self):
        self.login()
        id = self.create().get("id")

        data = {
            "price": "90"
        }
        response = self.client.put(f"/ticket/{id}", data=data, format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(response.data["price"], "90")

    def test_ticket_delete_with_id(self):
        self.login()
        id = self.create().get("id")
        response = self.client.delete(f"/ticket/{id}", format="json")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        self.assertEqual(len(Ticket.objects.filter(id=id)), 0)
