from rest_framework import status
from rest_framework.test import APITestCase

from api.models import Event


class EventInfoTestCase(APITestCase):
    def login(self):
        response = self.client.post('/log_in/', {'email': 'johndoe@example.org', 'password': 'Password123'},
                                    format='json')
        self.assertNotEqual(response.status_code, status.HTTP_404_NOT_FOUND)
        self.data['token'] = response.data['token']

    def create(self):
        """this is create fake data and as public function"""
        self.login()
        url = "/event/"
        data = {
            "society_email": "justin003@gmail.com",
            "duration": 10,
            "event_date": "2023-02-22T00:00:00Z",
            "event_name": "football-match",
            "location": "london",
            "description": "london is very famous city",
            "price": 37.0,
            "update_time": "2023-02-27T12:56:12.921756Z",
            "create_time": "2023-02-25T11:47:06.216393Z"
        }
        response = self.client.post(url, data, format='json')
        self.assert_(len(response.data) > 0)
        return response.data

    def test_event_get_with_id(self):
        """
          Ensure we can get the event by id.
        """
        self.login()
        id = self.create().get("id")
        response = self.client.get(f"/event/{id}/", format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)

    def test_event_update_with_id(self):
        """
           Ensure we can update the event by id.
        """
        self.login()
        id = self.create().get("id")
        url = f"/event/{id}/"
        data = {
            "society_email": "justin009@gmail.com",
            "duration": 20,
            "event_date": "2023-02-22T00:00:00Z",
            "event_name": "football-match",
            "location": "london",
            "description": "london is very famous city",
            "price": 37.0,
            "update_time": "2023-03-01T11:34:42.482018Z",
            "create_time": "2023-02-27T14:48:41.235910Z"
        }
        response = self.client.put(url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data["society_email"], "justin009@gmail.com")

    def test_event_delete_with_id(self):
        """
           Ensure we can delete the event by id.
        """
        self.login()
        id = self.create().get("id")
        url = f"/event/{id}/"
        response = self.client.delete(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
        obj = Event.objects.filter(id=id)
        self.assertEqual(len(obj), 0)
