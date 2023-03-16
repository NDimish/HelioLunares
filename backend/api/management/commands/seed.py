from api.models import *
from faker import Faker
from faker.providers import DynamicProvider
from django.db import IntegrityError
from django.core.management.base import BaseCommand, CommandError
import random
import csv
class Command(BaseCommand):
    
    def __init__(self):
        super().__init__()
        self.faker = Faker("en_GB")
        self.fields_of_study_provider = DynamicProvider(
            provider_name = "field_of_study",
            elements= [
            'Computer Science',
            'Electrical Engineering',
            'Mathematics',
            'Physics',
            'General Engineering',
            'History',
            'History and Politics',
            'Computer Science and Maths',
            'Economics and Politics',
            'Entomology',
            'Environmental Science & Ecology',
            'Food & Nutritional Science',
            'Forest Ecology & Management',
            'Horticulture',
            'Landscape Architecture',
            'Land & Water Resource Engineering',
            'Meat Science',
            'Pathobiology',
            'Plant Genetics',
            'Plant Pathology',
            'Poultry Science',
            'Aerospace/Aeronautical/Astronautics'
            'Agricultural',
            'Architectural (Building & Construction)',
            'Bioengineering (all Bio-related fields)',
            'Chemical/Petroleum',
            'Civil Engineering',
            'Construction Engineering/Management'
        ])
        self.faker.add_provider(self.fields_of_study_provider)
        self.society_name_provider = DynamicProvider(
            provider_name = "society_name",
            elements= [
                'German Society',
                'Spanish Society',
                'English Language Society',
                'Language Society',
                'Arabic Society',
                'Hindi Society',
                
                'Archery Society',
                'Shooting Society',
                'Geology Society',
                'Anime Society',
                'Jui-jitsu Society',
                'Karting Society',
                'Film Society',      
            ]
        )
        self.faker.add_provider(self.society_name_provider)
        Faker.seed(0)
        random.seed(1)
     
    #Read from the CSV file to create all the university models.   
    def generate_universities(self):
        university_entries = []
        with open("university_data.csv", 'r') as file:
            csvreader = csv.reader(file)
            for row in csvreader:
                university_entries.append(row)
                
        cleaned_entries = []
        
        counter = 2
        while counter < len(university_entries):
            entry_to_clean = university_entries[counter]
            
            #clean the university name from commas in the CSV
            if entry_to_clean[0][-1] == ',':
                entry_to_clean[0] = entry_to_clean[0][:-1]
    
            #Clean the university postcode from commas in the CSV
            if entry_to_clean[1][-1] == ',':
                entry_to_clean[1] = entry_to_clean[1][:-1]
            
            #Clean the university street_name from commas in the CSV
            if entry_to_clean[2][-1] == ',':
                entry_to_clean[2] = entry_to_clean[2][:-1]

            #Turn the latitude and longitude into actual numbers rather than strings.
            longitude = float(entry_to_clean[3])
            latitude = float(entry_to_clean[4])

            entry_to_clean[3] = longitude
            entry_to_clean[4] = latitude
                
                
            cleaned_entries.append(entry_to_clean)
            counter += 1
        
        #Create the models;
        for entry in cleaned_entries:
            
            uni_name = entry[0]
            uni_postcode = entry[1]
            uni_street_name = entry[2]
            uni_longitude = entry[3]
            uni_latitude = entry[4]
            
            try:
                uni = University.objects.create(
                    name = uni_name,
                    postcode = uni_postcode,
                    street_name = uni_street_name,
                    longitude = uni_longitude,
                    latitude = uni_latitude
                )
                
                uni.save()
                
            except (IntegrityError):
                print(f"object {uni_name}  was already seeded.")
    
    def generate_user(self):
        first_name = self.faker.first_name()
        last_name = self.faker.last_name()
        users_level = random.randint(1,3)
        
        try:
            user = User.objects.create_user(
                email = f'{first_name.lower()}.{last_name.lower()}@{self.faker.domain_name()}', 
                password = "Password123",
                user_level = users_level
            )
            user.save()
        except (IntegrityError):
            print(f"object {first_name, last_name}  was already seeded.")
            
        
    def generate_person(self):
        
        #We get non society memebers, so student and non-student.
        users = User.objects.filter(user_level=1) | User.objects.filter(user_level=2)
        unis = University.objects.all()
        
        # university_min_key_value = University.objects.first().id
        # university_max_key_value = University.objects.last().id
        # university_at = University.objects.get(id = random.randint(university_min_key_value, university_max_key_value - 1))
        
        university_at = unis[random.randint(0, len(unis) - 1)]
        obtained_user = users[random.randint(0, len(users) - 1)]
        
        name_of_email = obtained_user.email.split("@")[0]
        
        first_name_from_email = name_of_email.split(".")[0]
        last_name_from_email = name_of_email.split(".")[1]
            
        try:
            person = People.objects.create(
                user = obtained_user,
                first_name = first_name_from_email,
                last_name = last_name_from_email,
                field_of_study = self.faker.field_of_study(),
                university_studying_at = university_at
            )
            person.save()
            
        except (IntegrityError):
            print(f"object {first_name_from_email, last_name_from_email}  was already seeded.")
    
    def generate_socity(self):
        users = User.objects.filter(user_level=3)
        unis = University.objects.all()
        
        # university_min_key_value = University.objects.first().id
        # university_max_key_value = University.objects.last().id
        # university_at = University.objects.get(id = random.randint(university_min_key_value, university_max_key_value - 1))
        
        university_at = unis[random.randint(0, len(unis) - 1)]
        obtained_user = users[random.randint(0, len(users) - 1)]
        
        try:
            soc = Society.objects.create(
                user = obtained_user,
                name = university_at.name + " " + self.faker.society_name(),
                creation_date = self.faker.date(),
                about_us = self.faker.paragraphs(nb=3),
                university_society_is_at = university_at
            )
            
            soc.save()
            
        except (IntegrityError):
            print(f"object {university_at.name, obtained_user.email}  was already seeded.")
            
    def generate_event(self):
        pass
    
    def handle(self, *args, **options):
        print("seeding...")
        
        """
        Create all the seeded data here.
        
            1: See all of the unis first. You cannot seed them again afterwards.
            2: We generate users, NOT PEOPLE. These users will be assigned to the people db.
            3: We generate societies.
        """
        
        self.generate_universities()
        
        
        #NOTE: The number 'counter', below must be the same for both for loops as socities and persons to user is a 1 to 1 relationship.
        counter = 75
        #Generate default user accounts.
        for i in range(1, counter):
            self.generate_user()
        
        #Generate people and societies.
        for i in range(1, counter):
            self.generate_person()
            self.generate_socity()
        
        print(f"done.")
        print(f"{University.objects.count()} unis in the db.")
        print(f"{User.objects.count()} users in the db.")
        print(f"{People.objects.count()} people in the db")
        print(f"{Society.objects.count()} socities in the db.")
        
        # print(f"{Event.objects.count()} events in the db.")
        # print(f"{Ticket.objects.count()} tickets in the db.")