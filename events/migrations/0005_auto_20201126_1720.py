# Generated by Django 3.1 on 2020-11-26 11:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0004_auto_20201126_1544'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Cultural',
        ),
        migrations.RemoveField(
            model_name='event',
            name='id',
        ),
        migrations.AddField(
            model_name='event',
            name='event_id',
            field=models.AutoField(default='rangoli.jpg', primary_key=True, serialize=False),
            preserve_default=False,
        ),
    ]
