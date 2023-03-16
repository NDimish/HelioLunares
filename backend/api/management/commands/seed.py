from api.models import *
from faker import Faker
from django.db import IntegrityError
from django.core.management.base import BaseCommand, CommandError
import random
class Command(BaseCommand):
    
    def __init__(self):
        super().__init__()
        self.faker = Faker("en_GB")
        Faker.seed(0)
        random.seed(1)
     
    #Read from the CSV file to create all the university models.   
    def generate_universities(self):
        pass
    
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
        
        print(f"done.")
        print(f"{User.objects.count()} users in the db.")
        print(f"{People.objects.count()} people in the db")
        print(f"{Society.objects.count()} socities in the db.")
        print(f"{Event.objects.count()} events in the db.")
        print(f"{Ticket.objects.count()} tickets in the db.")