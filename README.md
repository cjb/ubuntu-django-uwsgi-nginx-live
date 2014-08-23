cjbprime/ubuntu-django-uwsgi-nginx-live
==================

docker image for django (uwsgi) & nginx based off of stackbrew/ubuntu:12.04, with support for databases and overlaying database-backed apps as a Docker image.

To pull this image:
`docker pull cjbprime/ubuntu-django-uwsgi-nginx-live`

Example usage:
`docker run -p 80 -d -e MODULE=myapp mbentley/ubuntu-django-uwsgi-nginx`

You can mount the application volume to run a specific application.  The default volume inside in the container is `/opt/django/app`.  Here is an example:
`docker run -p 80 -d -e MODULE=myapp -v /home/cjb/myapp:/opt/django/app cjbprime/ubuntu-django-uwsgi-nginx-live`

This image is based on mbentley/ubuntu-django-uwsgi-nginx, but supports having arbitrary django apps passed in as an image, and will install their requirements. You can also link this image to a database server, and syncdb/migrate will be run when the image starts.  If you need to create an admin user, you can do that inside a `docker_run.sh` file in your app directory.

By default, this just runs a default 'welcome to django' project.
