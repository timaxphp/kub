# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-03-25 21:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tourney', '0002_auto_20160325_1719'),
    ]

    operations = [
        migrations.RenameField(
            model_name='city',
            old_name='city_css',
            new_name='css',
        ),
        migrations.AddField(
            model_name='city',
            name='image',
            field=models.ImageField(blank=True, upload_to=b''),
        ),
    ]