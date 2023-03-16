from api.models import *
from faker import Faker
from django.db import IntegrityError
from django.core.management.base import BaseCommand, CommandError
import random
import csv
class Command(BaseCommand):
    
    def __init__(self):
        super().__init__()
        self.faker = Faker("en_GB")
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
        
        # show the cleaned entries ready for model creation.
        # for entry in cleaned_entries:
        #     print(entry)
        
        
        #Create the models;
        for entry in cleaned_entries:
            University.objects.create(
                name = entry[0],
                postcode = entry[1],
                street_name = entry[2],
                longitude = entry[3],
                latitude = entry[4]
            )
            break
        
    
    def generate_people(self):
        pass
    
    def generate_socities(self):
        pass
    
    def generate_events(self):
        pass
    
    def handle(self, *args, **options):
        print("seeding...")
        
        """
        Create all the seeded data here.
        """
        
        #self.generate_universities()
        
        # print(f"done.")
        # print(f"{User.objects.count()} users in the db.")
        # print(f"{People.objects.count()} people in the db")
        # print(f"{Society.objects.count()} socities in the db.")
        # print(f"{Event.objects.count()} events in the db.")
        # print(f"{Ticket.objects.count()} tickets in the db.")