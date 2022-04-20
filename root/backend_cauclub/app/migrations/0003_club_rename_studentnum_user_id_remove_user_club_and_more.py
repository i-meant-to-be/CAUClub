# Generated by Django 4.0.4 on 2022-04-14 18:31

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_remove_user_id_alter_user_studentnum'),
    ]

    operations = [
        migrations.CreateModel(
            name='Club',
            fields=[
                ('name', models.CharField(max_length=20, primary_key=True, serialize=False)),
                ('media', models.CharField(max_length=20, unique=True)),
                ('dept', models.CharField(max_length=20)),
            ],
        ),
        migrations.RenameField(
            model_name='user',
            old_name='studentNum',
            new_name='id',
        ),
        migrations.RemoveField(
            model_name='user',
            name='club',
        ),
        migrations.AddField(
            model_name='user',
            name='contact',
            field=models.CharField(default='010-1234-5678', max_length=20),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='user',
            name='dept',
            field=models.CharField(default='010-1234-5678', max_length=20),
            preserve_default=False,
        ),
        migrations.CreateModel(
            name='History',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('period', models.IntegerField()),
                ('position', models.CharField(max_length=10)),
                ('clubName', models.ForeignKey(db_column='name', on_delete=django.db.models.deletion.CASCADE, to='app.club')),
                ('userId', models.ForeignKey(db_column='studentNum', on_delete=django.db.models.deletion.CASCADE, to='app.user')),
            ],
        ),
    ]
