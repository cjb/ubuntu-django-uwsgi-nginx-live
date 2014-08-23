#!/bin/bash

MODULE=${MODULE:-website}

sed -i "s#module=website.wsgi:application#module=${MODULE}.wsgi:application#g" /opt/django/uwsgi.ini

if [ ! -f "/opt/django/app/manage.py" ]
then
	echo "creating basic django project (module: ${MODULE})"
	django-admin.py startproject ${MODULE} /opt/django/app/
else
	echo "Using existing django project"
	if [ -f "/opt/django/app/requirements/dev.txt" ]
	then
		pip install -r /opt/django/app/requirements/dev.txt
	elif [ -f "/opt/django/app/requirements.txt" ]
	then
		pip install -r /opt/django/app/requirements.txt
	fi
	cd /opt/django/app
	./manage.py syncdb
	./manage.py migrate
fi

if [ -f "/opt/django/app/docker_run.sh" ]
then
	# You can put image custom setup scripts here.
	source /opt/django/app/docker_run.sh
fi

/usr/bin/supervisord
