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
                "Accounting and Finance",
                "Aeronautical & Manafacturing Engineering",
                "Agriculture and Forestry",
                "Anatomy and Physiology",
                "Anthropology",
                "Archaeology",
                "Architecture",
                "Art & Design",
                "Biological Sciences",
                "Building",
                "Business and Management Studies",
                "Chemical Engineering",
                "Chemistry",
                "Civil Engineering",
                "Classics and Ancient History",
                "Communication and Media Studies",
                "Complementary Medicine",
                "Computer Science",
                "Counselling",
                "Creative Writing",
                "Criminology",
                "Dentistry",
                "Drama Dance and Cinematics",
                "Economics",
                "Education",
                "Electrical and Electronic Engineering",
                "English",
                "Fashion",
                "Film Making",
                "Food Science",
                "Forensic Science",
                "General Engineering",
                "Geography and Environmental Science",
                "Geology",
                "Health and Social Care",
                "History",
                "History of Art Architecture and Design",
                "Hospitality Leisure Recreation and Tourism",
                "Information Technology",
                "Land and Property Management",
                "Law",
                "Linguistics",
                "Marketing",
                "Materials Technology",
                "Mathematics",
                "Mechanical Engineering",
                "Medical Technology",
                "Medicine",
                "Music",
                "Nursing",
                "Occupational Therapy",
                "Pharmacology and Pharmacy",
                "Philosophy",
                "Physics and Astronomy",
                "Physiotherapy",
                "Psychology",
                "Robotics",
                "Social Policy",
                "Social Work",
                "Sociology",
                "Sports Science",
                "Veterinary Medicine",
                "Youth Work"
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
        
        self.society_categories_provider = DynamicProvider(
            provider_name="society_categories",
            elements=[
                "Business, Finance & Entrepreneurship",
                "Culture",
                "Medical",
                "Faith & Spirituality",
                "Causes & Campaigning",
                "Common Interest",
                "Academic",
                "Music & Performance",
                "Political",
                "Arts & Creative",
                "Volunteering & Fundraising",
                "Media",
                "Fundraising",
                "Other"
            ]
        )
        self.faker.add_provider(self.society_categories_provider)
        
        self.event_categories_provider = DynamicProvider(
            provider_name="event_categories",
            elements=[
                "Business", 
                "Finance & Entrepreneurship",
                "Culture",
                "Medical",
                "Faith & Spirituality",
                "Causes & Campaigning",
                "Common Interest",
                "Academic",
                "Music & Performance",
                "Political",
                "Arts & Creative",
                "Volunteering & Fundraising",
                "Media",
                "Fundraising",
                "Language",
                "Sports",
                "Other",
                "Language",
                "Film",
                "Racing",
                "Dance",
                "Science",
                "Astronomy",
                "Mixed Martial Arts",
                "Literature",
                "Law",
            ]
        )
        self.faker.add_provider(self.event_categories_provider)
        
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
    
    def generate_event_categories_type(self):
        event_categories = [
                "Business", 
                "Finance & Entrepreneurship",
                "Culture",
                "Medical",
                "Faith & Spirituality",
                "Causes & Campaigning",
                "Common Interest",
                "Academic",
                "Music & Performance",
                "Political",
                "Arts & Creative",
                "Volunteering & Fundraising",
                "Media",
                "Fundraising",
                "Language",
                "Sports",
                "Other",
                "Language",
                "Film",
                "Racing",
                "Dance",
                "Science",
                "Astronomy",
                "Mixed Martial Arts",
                "Literature",
                "Law",
            ]
        for event in event_categories:
            try:
                event_cat = EventCategoriesType.objects.create(
                    category_name = event
                )
                event_cat.save()
                
            except (IntegrityError):
                print(f"object {event}  was already seeded.")
                
            
    
    def generate_society_categories_type(self):
        soc_categories = [
                "Business, Finance & Entrepreneurship",
                "Culture",
                "Medical",
                "Faith & Spirituality",
                "Causes & Campaigning",
                "Common Interest",
                "Academic",
                "Music & Performance",
                "Political",
                "Arts & Creative",
                "Volunteering & Fundraising",
                "Media",
                "Fundraising",
                "Sports",
                "Other"
            ]
        for soc_cat in soc_categories:
            try:
                society_category = SocietyCategoriesType.objects.create(
                    category_name = soc_cat
                )
                society_category.save()
                
            except (IntegrityError):
                print(f"object {soc_cat}  was already seeded.")
            
    def generate_event(self):
        societies = Society.objects.all()
        
        obtained_society = societies[random.randint(0, len(societies) - 1)]
        event_name = obtained_society.name + " - Event " + self.faker.word()
        try:
            event = Event.objects.create(
                society_id = obtained_society,
                duration = random.randint(15, 180),
                event_date = self.faker.future_date(),
                event_name = event_name,
                location = self.faker.county(),
                description = self.faker.paragraphs(nb=3),
                price = random.randint(0, 200)
            )
            
            event.save()
            
        except (IntegrityError):
            print(f"object {event, event_name}  was already seeded.")
        
    def generate_event_categories(self):
        events = Event.objects.all()
        category_types = EventCategoriesType.objects.all()
        
        obtained_event = events[random.randint(0, len(events) - 1)]
        
        for i in range(0, random.randint(1, 4)):
            try:
                e = EventCategories.objects.create(
                    eventId = obtained_event,
                    categoryId = category_types[random.randint(0, len(category_types) - 1)]
                )
                e.save()
            except (IntegrityError):
                print(f"object {obtained_event.event_name}  was already seeded.")
            
    def generate_society_categories(self):
        societies = Society.objects.all()
        category_types = SocietyCategoriesType.objects.all()
        
        obtained_society = societies[random.randint(0, len(societies) - 1)]
            
        for i in range(0, random.randint(1, 4)):
            try:
                s = SocietyCategories.objects.create(
                    societyId = obtained_society,
                    categoryId = category_types[random.randint(0, len(category_types) - 1)]
                )
                s.save()
            except (IntegrityError):
                print(f"object {obtained_society.name}  was already seeded.")
                
    def generate_tickets(self):
        events = Event.objects.all()
        #Shouldn't this be People?
        users = User.objects.all()
        
        obtained_event = events[random.randint(0, len(events) - 1)]
        obtained_user = users[random.randint(0, len(users) - 1)]
        
        try:
            t = Ticket.objects.create(
                event = obtained_event,
                user = obtained_user,
                price = obtained_event.price
            )
            t.save()
        except (IntegrityError):
            print(f"object {obtained_event.event_name, obtained_user.email}  was already seeded.")
    
    def generate_person_role_at_society(self):
        societies = Society.objects.all()
        people = People.objects.all()
        
        obtained_society = societies[random.randint(0, len(societies) - 1)]
        obtained_person = people[random.randint(0, len(people) - 1)]
        
        try:
            prole = PeopleRoleAtSociety.objects.create(
                society = obtained_society,
                user_at_society = obtained_person,
                role = random.randint(1, 3)
            )
            prole.save()
            
        except (IntegrityError):
            print(f"object {obtained_person.first_name, obtained_society.name}  was already seeded.")
        
    def handle(self, *args, **options):
        print("seeding...")
        
        """
        Create all the seeded data here.
        
            1: See all of the unis first. You cannot seed them again afterwards.
            2: We generate the event category types.
            3: We generate the society category types.
            4: We generate users, NOT PEOPLE. These users will be assigned to the people db.
            5: We generate societies.
            6: We generate events.
            7: We then generate tickets.
            8: We add categories to the societies.
            9: We add categories to the events.
        """
        
        self.generate_universities()
        self.generate_event_categories_type()
        self.generate_society_categories_type()
        
        
        unis = University.objects.all()
        
        first_name_1 = "John"
        last_name_1 = "Doe"
        user_level_1 = 1
        
        # john.doe@gmail.com  
        # JohnDoe123!
        try:
            johnDoe = User.objects.create_user(
                email = f'{first_name_1.lower()}.{last_name_1.lower()}@{"gmail.com"}', 
                password = "JohnDoe123!",
                user_level = user_level_1
            )
            johnDoe.save()
        except (IntegrityError):
            print(f"object {first_name_1, last_name_1}  was already seeded.")
        
        
        first_name_2 = "Jane"
        last_name_2 = "Doe"
        user_level_2 = 2
        
        # jane.doe@gmail.com  
        # JaneDoe123!
        try:
            janeDoe = User.objects.create_user(
                email = f'{first_name_2.lower()}.{last_name_2.lower()}@{"gmail.com"}', 
                password = "JaneDoe123!",
                user_level = user_level_2
            )
            janeDoe.save()
        except (IntegrityError):
            print(f"object {first_name_2, last_name_2}  was already seeded.")
            
            
        soc_email = "kingsCollegeGeographySoc@kcl.ac.uk"
        user_level_3 = 3
        
        # kingsCollegeGeographySoc@kcl.ac.uk 
        # KingsCollegeGeog10!
        try:
            kclGeogSoc = User.objects.create_user(
                email = soc_email,
                password = "KingsCollegeGeog10!",
                user_level = user_level_3
            )
            
            kclGeogSoc.save()
            
        except (IntegrityError):
            print(f"object {soc_email}  was already seeded.")
        
        # Create the actual students and societies.
        
        try:
            john_university_at = unis[random.randint(0, len(unis) - 1)]
            person_john = People.objects.create(
                user = johnDoe,
                first_name = first_name_1,
                last_name = last_name_1,
                field_of_study = self.faker.field_of_study(),
                university_studying_at = john_university_at
            )
            person_john.save()
            
        except (IntegrityError):
            print(f"object {johnDoe.first_name, johnDoe.last_name}  was already seeded.")
        
        
        try:
            jane_university_at = unis[random.randint(0, len(unis) - 1)]
            person_jane = People.objects.create(
                user = janeDoe,
                first_name = first_name_2,
                last_name = last_name_2,
                field_of_study = self.faker.field_of_study(),
                university_studying_at = jane_university_at
            )
            person_jane.save()
            
        except (IntegrityError):
            print(f"object {janeDoe.first_name, janeDoe.last_name}  was already seeded.")
        
    
        try:
            soc_university_at = unis[random.randint(0, len(unis) - 1)]
            soc = Society.objects.create(
                user = kclGeogSoc,
                name = soc_university_at.name + " " + self.faker.society_name(),
                creation_date = self.faker.date(),
                about_us = self.faker.paragraphs(nb=3),
                university_society_is_at = soc_university_at
            )
            
            soc.save()
            
        except (IntegrityError):
            print(f"object {kclGeogSoc.soc_email, soc_university_at.name}  was already seeded.")
        
        
        
        
        #NOTE: The number 'counter', below must be the same for both for loops as socities and persons to user is a 1 to 1 relationship.
        counter = 75
        
        #Generate default user accounts.
        for i in range(1, counter):
            self.generate_user()
        
        #Generate people and societies.
        for i in range(1, counter):
            self.generate_person()
            self.generate_socity()
        
        for i in range(1, 100):
            self.generate_person_role_at_society()
            self.generate_event()
            
        for i in range(1, 200):
            self.generate_tickets()
            
        for i in range(1, 100):
            self.generate_society_categories()
            self.generate_event_categories()
        
        print(f"\n\ndone.")
        print(f"{University.objects.count()} unis in the db.")
        
        print(f"{User.objects.count()} users in the db.")
        print(f"{People.objects.count()} people in the db")
        print(f"{Society.objects.count()} socities in the db.")
        print(f"{PeopleRoleAtSociety.objects.count()} roles in the db.")
        
        print(f"{Event.objects.count()} events in the db.")
        print(f"{Ticket.objects.count()} tickets in the db.")
        
        print(f"{EventCategories.objects.count()} events / categories in the db.")
        print(f"{EventCategoriesType.objects.count()} types of event categories in the db.")
        
        print(f"{SocietyCategories.objects.count()} societies / categories in the db.")
        print(f"{SocietyCategoriesType.objects.count()} types of society categories in the db.")