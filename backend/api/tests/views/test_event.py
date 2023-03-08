from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse

from api.models import Event, User


class EventTestCase(APITestCase):
    def setUp(self):
        self.user = User.objects.filter(email='johndoe@example.org').first()
        
    def test_event_create(self):
        """
          Ensure we can get all the event objects.
        """
        url = reverse("event")
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
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Event.objects.count(), 1)
        self.assertEqual(Event.objects.get().society_email, "justin003@gmail.com")

    def test_event_get_list(self):
        """
          Ensure we can get all the event objects.

          we have two steps:1.create data 2.query data list
        """
        # self.client.force_authenticate(self.user)

        url = reverse("event")

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
        self.client.post(url, data, format='json')

        # query data list
        response = self.client.get(url, format='json')
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assert_(len(response.data) > 0)
