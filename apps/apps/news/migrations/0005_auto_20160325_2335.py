# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-03-25 21:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0004_auto_20160325_2248'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='type',
            field=models.CharField(choices=[('russian_bowl', '\u041a\u0443\u0431\u043e\u043a \u0420\u043e\u0441\u0441\u0441\u0438\u0438'), ('region_bowl', '\u0420\u0435\u0433\u0438\u043e\u043d\u0430\u043b\u044c\u043d\u044b\u0435 \u041a\u0443\u0431\u043a\u0438'), ('online_qualifying', '\u041e\u043d\u043b\u0430\u0439\u043d \u041e\u0442\u0431\u043e\u0440\u043e\u0447\u043d\u044b\u0435')], max_length=100),
        ),
    ]
