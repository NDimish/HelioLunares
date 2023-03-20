from django.core.management.base import BaseCommand, CommandError
from api.models import *
class Command(BaseCommand):

    def __init__(self):
        super().__init__()
        
    def unseed_users(self):
        if (User.objects.count() > 0):
            print("unseeding users...")
            for e in User.objects.all():
                if e.is_superuser is False:
                    e.delete()
                    
            print(f"done. {User.objects.count()} users in db.")
        else:
            print("no seeded users in database.")
            
    def unseed_people(self):
        if (People.objects.count() > 0):
            print("unseeding people...")
            for p in People.objects.all():
                p.delete()
                    
            print(f"done. {People.objects.count()} people in db.")
        else:
            print("no seeded people in database.")
            
    def unseed_society_categories(self):
        if (SocietyCategories.objects.count() > 0):
            print("unseeding types of categories with societes...")
            for sc in SocietyCategories.objects.all():
                sc.delete()
                    
            print(f"done. {SocietyCategories.objects.count()} societies with categories in db.")
        else:
            print("no seeded users in database.")
            
    def unseed_event_categories(self):
        if (EventCategories.objects.count() > 0):
            print("unseeding types of categories with events...")
            for ec in EventCategories.objects.all():
                ec.delete()
                    
            print(f"done. {EventCategories.objects.count()} events with categories in db.")
        else:
            print("no seeded users in database.")
            
    def unseed_tickets(self):
        if (Ticket.objects.count() > 0):
            print("unseeding tickets...")
            for t in Ticket.objects.all():
                t.delete()
                    
            print(f"done. {Ticket.objects.count()} tickets in db.")
        else:
            print("no seeded users in database.")
            
    def unseed_events(self):
        if (Event.objects.count() > 0):
            print("unseeding types of events...")
            for e in Event.objects.all():
                e.delete()
                    
            print(f"done. {Event.objects.count()} events in db.")
        else:
            print("no seeded users in database.")
            
    def unseed_societies(self):
        if (Society.objects.count() > 0):
            print("unseeding societies...")
            for s in Society.objects.all():
                s.delete()
                    
            print(f"done. {Society.objects.count()} societies in db.")
        else:
            print("no seeded societies in database.")
                    
    def unseed_universities(self):
        if (University.objects.count() > 0):
            print("unseeding unis...")
            for u in University.objects.all():
                u.delete()
                    
            print(f"done. {University.objects.count()} unis in db.")
        else:
            print("no seeded users in database.")
            
    def unseed_society_category_types(self):
        if (SocietyCategoriesType.objects.count() > 0):
            print("unseeding types of society categories...")
            for sct in SocietyCategoriesType.objects.all():
                sct.delete()
                    
            print(f"done. {SocietyCategoriesType.objects.count()} society categories in db.")
        else:
            print("no seeded users in database.")
            
    def unseed_event_category_types(self):
        if (EventCategoriesType.objects.count() > 0):
            print("unseeding event categories...")
            for ect in EventCategoriesType.objects.all():
                ect.delete()
                    
            print(f"done. {EventCategoriesType.objects.count()} event categories in db.")
        else:
            print("no seeded users in database.")
            
    def unseed_roles(self):
        if (PeopleRoleAtSociety.objects.count() > 0):
            print("unseeding roles in societies...")
            for p_role in PeopleRoleAtSociety.objects.all():
                p_role.delete()
                    
            print(f"done. {PeopleRoleAtSociety.objects.count()} people roles in societies in db.")
        else:
            print("no seeded roles in database.")
            

    def handle(self, *args, **options):
        self.unseed_tickets()
        self.unseed_events()
        self.unseed_roles()
        
        self.unseed_event_categories()
        self.unseed_society_categories()
        
        self.unseed_event_category_types()
        self.unseed_society_category_types()
        
        self.unseed_societies()
        self.unseed_people()
        self.unseed_users()
        
        self.unseed_universities()