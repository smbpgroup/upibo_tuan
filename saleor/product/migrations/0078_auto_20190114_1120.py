# Generated by Django 2.0.8 on 2019-01-14 04:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0077_imagedata_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagedata',
            name='category',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='images', to='product.Category'),
        ),
    ]
