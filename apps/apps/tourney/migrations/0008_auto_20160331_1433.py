# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-03-31 11:33
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('tourney', '0007_auto_20160330_2310'),
    ]

    operations = [
        migrations.AlterField(
            model_name='rules',
            name='city',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='tourney.City', verbose_name='\u0413\u043e\u0440\u043e\u0434'),
        ),
    ]