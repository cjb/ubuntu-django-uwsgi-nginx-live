#!/bin/bash

# http://source.mihelac.org/2009/10/23/django-avoiding-typing-password-for-superuser/
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'pass')" | ./manage.py shell
