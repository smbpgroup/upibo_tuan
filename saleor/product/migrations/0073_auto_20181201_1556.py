# -*- coding: utf-8 -*-
# Generated by Django 1.11.16 on 2018-12-01 08:56
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0072_auto_20181201_1453'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='imagedata',
            options={'ordering': ('sort_order',), 'verbose_name': 'Image Example', 'verbose_name_plural': 'Image Examples'},
        ),
        migrations.AddField(
            model_name='imagedata',
            name='sort_order',
            field=models.PositiveIntegerField(db_index=True, default=100, editable=False),
            preserve_default=False,
        ),
    ]
