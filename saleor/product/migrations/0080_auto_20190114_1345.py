# Generated by Django 2.0.8 on 2019-01-14 06:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0079_auto_20190114_1122'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagedata',
            name='category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='imagedata', to='product.Category'),
        ),
    ]
