from django.core.management.base import BaseCommand, CommandError
from api.models import University, User, Society, People
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

    def handle(self, *args, **options):
        self.unseed_societies()
        self.unseed_people()
        self.unseed_users()
        self.unseed_universities()