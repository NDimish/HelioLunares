from rest_framework import status
from rest_framework.test import APITestCase
from api.models import User, Society, PeopleRoleAtSociety, People

class SocietyTestCase(APITestCase):

    fixtures = [
        'api/tests/fixtures/default_users.json',
        'api/tests/fixtures/default_university.json',
        'api/tests/fixtures/default_people.json',
        'api/tests/fixtures/default_society.json',
        'api/tests/fixtures/default_peopleroleatsociety.json',
    ]

    def setUp(self): 
        self.url = '/societyrole/'
        #data to login into a valid accound userlevel 1
        self.user_data = {
            "email": "janedoe@example.org",
            'password': 'Password123'
        }
        #data to create a new society.
        self.post_data = {
            "society": 5
        }
    
    def test_people_can_join_society_as_valid_user_level(self):
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url+'join/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_201_CREATED)
        people = People.objects.get(user_id=2)
        new_role = PeopleRoleAtSociety.objects.get(society=5,user_at_society=people)
        self.assertEquals(new_role.role,1)
    
    def test_people_cannot_join_society_as_invalid_user_level(self):
        self.user_data['email'] = "jamesdoe@example.org"
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url+'join/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
    
    def test_join_society_with_invalid_society(self):
        self.post_data["society"] = 99
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url+'join/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_404_NOT_FOUND)

    def test_join_society_when_already_joined(self):
        self.post_data["society"] = 3
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url+'join/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)

    def test_people_can_leave_society(self):
        self.post_data["society"] = 3
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        people = People.objects.get(user_id=2)
        #check it exists
        new_role = PeopleRoleAtSociety.objects.filter(society=3,user_at_society=people)
        self.assertEquals(len(new_role),1)
        
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_204_NO_CONTENT)
        
        new_role = PeopleRoleAtSociety.objects.filter(society=3,user_at_society=people)
        self.assertEquals(len(new_role),0)
    
    def test_people_cannot_leave_invalid_society(self):
        self.post_data["society"] = 55
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_404_NOT_FOUND)
    
    def test_people_cannot_leave_society_that_they_have_not_joined(self):
        self.post_data["society"] = 5
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)

    def test_society_user_cannot_leave_society(self):
        self.user_data['email'] = "jamesdoe@example.org"
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
    
    def test_people_with_higher_role_can_remove_people(self):
        #removing user 1 from society 3 as user 3
        self.post_data["society"] = 3
        self.post_data["user"] = 1
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        
        #check it exists
        new_role = PeopleRoleAtSociety.objects.filter(society=3,user_at_society=People.objects.get(user_id=1))
        self.assertEquals(len(new_role),1)
        
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_204_NO_CONTENT)
        
        new_role = PeopleRoleAtSociety.objects.filter(society=3,user_at_society=People.objects.get(user_id=1))
        self.assertEquals(len(new_role),0)
    
    def test_people_with_lower_role_cannot_remove_people(self):
        #attempting to remove user 2 from society 3 as user 1
        self.post_data["society"] = 3
        self.post_data["user"] = 2
        self.user_data['email'] = 'johndoe@example.org'
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        
        #check it exists
        new_role = PeopleRoleAtSociety.objects.filter(society=3,user_at_society=People.objects.get(user_id=1))
        self.assertEquals(len(new_role),1)
        
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        
        new_role = PeopleRoleAtSociety.objects.filter(society=3,user_at_society=People.objects.get(user_id=1))
        self.assertEquals(len(new_role),1)
    
    def test_society_can_remove_people(self):
        #removing user 1 from society 3 as user 3
        self.post_data["society"] = 3
        self.post_data["user"] = 2
        self.user_data['email'] = "jamesdoe@example.org"
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        
        #check it exists
        new_role = PeopleRoleAtSociety.objects.filter(society=3,user_at_society=People.objects.get(user_id=2))
        self.assertEquals(len(new_role),1)
        
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_204_NO_CONTENT)
        
        new_role = PeopleRoleAtSociety.objects.filter(society=3,user_at_society=People.objects.get(user_id=2))
        self.assertEquals(len(new_role),0)
    
    def test_people_remove_user_from_invalid_society(self):
        #removing user 1 from invalid society
        self.post_data["society"] = 99
        self.post_data["user"] = 1
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_404_NOT_FOUND)

    def test_society_remove_user_that_is_not_part_of_the_society(self):
        #removing user 2 from society 5 when user 2 is not part of the society
        self.post_data["society"] = 5
        self.post_data["user"] = 2
        self.user_data['email'] = 'jamesdoe@example.org'
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        
        #check it exists
        new_role = PeopleRoleAtSociety.objects.filter(society=5,user_at_society=People.objects.get(user_id=2))
        self.assertEquals(len(new_role),0)
        
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        
        new_role = PeopleRoleAtSociety.objects.filter(society=5,user_at_society=People.objects.get(user_id=2))
        self.assertEquals(len(new_role),0)
    
    def test_people_remove_user_that_is_not_part_of_the_society(self):
        #removing user 2 from society 5 when user 2 is not part of the society
        self.post_data["society"] = 5
        self.post_data["user"] = 2
        self.user_data['email'] = 'johndoe@example.org'
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        
        #check it exists
        new_role = PeopleRoleAtSociety.objects.filter(society=5,user_at_society=People.objects.get(user_id=2))
        self.assertEquals(len(new_role),0)
        
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        
        new_role = PeopleRoleAtSociety.objects.filter(society=5,user_at_society=People.objects.get(user_id=2))
        self.assertEquals(len(new_role),0)
    
    def test_people_removing_is_in_the_society(self):
        #removing user 1 from society 5 when user 2 is not part of the society
        self.post_data["society"] = 5
        self.post_data["user"] = 1
        self.user_data['email'] = 'janedoe@example.org'
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        response = self.client.post(self.url+'remove/',self.post_data , format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        
    def test_society_update_society_role_of_user(self):
        self.post_data.clear()
        self.post_data["user"] = 1
        self.post_data['role_level'] = 3
        self.user_data['email'] = "jamesdoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        before_role = PeopleRoleAtSociety.objects.get(society=3,user_at_society=1)
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_204_NO_CONTENT)
        after_role = PeopleRoleAtSociety.objects.get(society=3, user_at_society=1)
        self.assertNotEqual(before_role.role,after_role.role)
        self.assertEqual(after_role.role, 3)
    
    def test_society_update_society_role_of_user_in_different_society(self):
        self.post_data.clear()
        self.post_data['society'] = 4
        self.post_data["user"] = 1
        self.post_data['role_level'] = 3
        self.user_data['email'] = "jamesdoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        before_role = PeopleRoleAtSociety.objects.get(society=3,user_at_society=1)
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        after_role = PeopleRoleAtSociety.objects.get(society=3, user_at_society=1)
        self.assertEqual(before_role.role,after_role.role)
    
    def test_society_update_society_role_of_user_not_in_society(self):
        self.post_data.clear()
        self.post_data["user"] = 2
        self.post_data['role_level'] = 3
        self.user_data['email'] = "jamesondoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        before_role = PeopleRoleAtSociety.objects.filter(society=4,user_at_society=2)
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{'error': 'User has not joined society'})
        after_role = PeopleRoleAtSociety.objects.filter(society=4, user_at_society=2)
        self.assertEqual(len(before_role),len(after_role))
    
    def test_society_updates_with_incorrect_role(self):
        self.post_data.clear()
        self.post_data["user"] = 1
        self.post_data['role_level'] = 4
        self.user_data['email'] = "jamesdoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        before_role = PeopleRoleAtSociety.objects.filter(society=4,user_at_society=2)
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{'error':'Can not set level'})
        after_role = PeopleRoleAtSociety.objects.filter(society=4, user_at_society=2)
        self.assertEqual(len(before_role),len(after_role))
    
    def test_people_update_society_role_of_user_with_valid_perms(self):
        self.post_data["society"] = 3
        self.post_data["user"] = 1
        self.post_data['role_level'] = 2
        self.user_data['email'] = "janedoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        before_role = PeopleRoleAtSociety.objects.get(society=3,user_at_society=1)
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_204_NO_CONTENT)
        after_role = PeopleRoleAtSociety.objects.get(society=3, user_at_society=1)
        self.assertNotEqual(before_role.role,after_role.role)
        self.assertEqual(after_role.role, 2)
    
    def test_people_update_society_role_of_user_with_invalid_society(self):
        self.post_data["society"] = 55
        self.post_data["user"] = 1
        self.post_data['role_level'] = 2
        self.user_data['email'] = "janedoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_404_NOT_FOUND)
    
    def test_people_update_society_role_of_user_with_people_not_part_of_society(self):
        self.post_data["society"] = 5
        self.post_data["user"] = 1
        self.post_data['role_level'] = 2
        self.user_data['email'] = "janedoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{'error':'User has not joined society'})
    
    def test_people_update_society_role_of_user_with_people_not_having_power(self):
        self.post_data["society"] = 3
        self.post_data["user"] = 2
        self.post_data['role_level'] = 2
        self.user_data['email'] = "johndoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{'error':'User does not have adequte power.'})
    
    def test_people_update_society_role_of_user_with_user_not_part_of_society(self):
        self.post_data["society"] = 4
        self.post_data["user"] = 2
        self.post_data['role_level'] = 2
        self.user_data['email'] = "johndoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{'error':'User not joined society'})
    
    def test_people_update_society_role_of_user_with_invalid_role(self):
        self.post_data["society"] = 3
        self.post_data["user"] = 1
        self.post_data['role_level'] = 3
        self.user_data['email'] = "janedoe@example.org" #society user
        response = self.client.post('/log_in/',self.user_data,format='json')
        self.assertEqual(response.status_code,status.HTTP_200_OK)
        header = {'HTTP_AUTHORIZATION': f'token {response.data["token"]}'}
        #check role before request
        response = self.client.post(self.url+'update/',self.post_data,format='json',**header)
        self.assertEqual(response.status_code,status.HTTP_400_BAD_REQUEST)
        self.assertEqual(response.data,{'error':'Can not set level'})