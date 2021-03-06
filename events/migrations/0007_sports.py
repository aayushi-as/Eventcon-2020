# Generated by Django 3.1 on 2020-11-26 13:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0006_cultural'),
    ]

    operations = [
        migrations.CreateModel(
            name='sports',
            fields=[
                ('event_id', models.IntegerField(primary_key=True, serialize=False)),
                ('sports_name', models.TextField(max_length=50)),
                ('r_fees', models.FloatField()),
                ('date_of_event', models.DateTimeField()),
                ('venue', models.TextField(max_length=50)),
                ('details', models.TextField(max_length=100)),
                ('event_poster', models.TextField(max_length=50)),
            ],
        ),
    ]
