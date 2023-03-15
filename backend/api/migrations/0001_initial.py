# Generated by Django 4.1.3 on 2023-03-15 16:24

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('email', models.EmailField(max_length=254, unique=True, validators=[django.core.validators.EmailValidator()])),
                ('date_joined', models.DateField(auto_now_add=True)),
                ('user_level', models.PositiveSmallIntegerField(choices=[(1, 'student'), (2, 'committee'), (3, 'inner_circle_of_society'), (4, 'president_of_society'), (5, 'administrator')], default=1)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('duration', models.IntegerField()),
                ('event_date', models.DateTimeField()),
                ('event_name', models.CharField(max_length=50)),
                ('location', models.CharField(blank=True, max_length=50)),
                ('description', models.CharField(blank=True, max_length=500)),
                ('price', models.FloatField(max_length=10)),
                ('update_time', models.DateTimeField(auto_now=True)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name': 'event',
                'verbose_name_plural': 'event',
            },
        ),
        migrations.CreateModel(
            name='EventCategoriesType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_name', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='SocietyCategoriesType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_name', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='University',
            fields=[
                ('name', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('latitude', models.FloatField(max_length=10)),
                ('longitude', models.FloatField(max_length=10)),
                ('street_name', models.CharField(max_length=50)),
                ('postcode', models.CharField(max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='Society',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('name', models.CharField(max_length=40)),
                ('creation_date', models.DateField()),
                ('join_date', models.DateField(auto_now_add=True)),
                ('university_society_is_at', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.university')),
            ],
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('first_name', models.CharField(max_length=40)),
                ('last_name', models.CharField(max_length=40)),
                ('field_of_study', models.CharField(max_length=30)),
                ('university_studying_at', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.university')),
            ],
        ),
        migrations.CreateModel(
            name='Ticket',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField()),
                ('price', models.FloatField(default=0.0)),
                ('event', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.event')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='StudentRoleAtSociety',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('society', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.society')),
                ('user_at_society', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.student')),
            ],
            options={
                'db_table': 'tickets',
            },
        ),
        migrations.CreateModel(
            name='SocietyCategories',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('categoryId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.societycategoriestype')),
                ('societyId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.society')),
            ],
        ),
        migrations.CreateModel(
            name='EventCategories',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('categoryId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.eventcategoriestype')),
                ('societyId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.society')),
            ],
        ),
        migrations.AddField(
            model_name='event',
            name='society_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api.society'),
        ),
        migrations.AddConstraint(
            model_name='studentroleatsociety',
            constraint=models.UniqueConstraint(fields=('society', 'user_at_society'), name='user_identification'),
        ),
    ]
