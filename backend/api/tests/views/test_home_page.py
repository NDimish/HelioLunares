from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User, Society


class HomePageTestCase(APITestCase):
    """Home Page"""
    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_society.json',
    ]

    def setUp(self): 
        self.url = '/homepage/'

    
    def test_url_exists_with_get(self):
        response = self.client.get(self.url, format='json')
        self.assertNotEqual(response.status_code,status.HTTP_404_NOT_FOUND)
    
    def test_url_works_without_authorisation(self):
        response = self.client.get(self.url, format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
    
    def test_url_returns_correct_data(self):
        response = self.client.get(self.url, format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        self.assertEqual(len(response.data),3)
        self.assertEqual(len(response.data[0]),3)