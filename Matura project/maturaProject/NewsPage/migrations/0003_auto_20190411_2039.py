# Generated by Django 2.1.5 on 2019-04-11 18:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('NewsPage', '0002_auto_20190411_1812'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news',
            name='text',
            field=models.CharField(max_length=10000000),
        ),
    ]
