# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-03-25 20:48
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('tourney', '0002_auto_20160325_1719'),
        ('news', '0003_auto_20160325_2208'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='article',
            name='city',
        ),
        migrations.AddField(
            model_name='article',
            name='city',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='tourney.City'),
        ),
    ]