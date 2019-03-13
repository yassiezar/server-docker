# Pull base image
FROM python:3.7-slim

# Set work directory
RUN mkdir /jclock
WORKDIR /jclock

# Install build files
RUN apt-get update && apt-get install -y build-essential

# Install dependencies
RUN pip install pipenv
COPY Pipfile Pipfile.lock /jclock/
RUN pipenv install --system

# Copy project
COPY ./ScalewayWebsite/ /jclock/

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#ENV DJANGO_SETTINGS_MODULE=/jclock/ScalewayWebsite/ScalewayWebsite.settings.deploy

# uWSGI configuration (customize as needed):
#ENV UWSGI_WSGI_FILE=ScalewayWebsite/ScalewayWebsite.wsgi UWSGI_HTTP=:8000 UWSGI_MASTER=1 UWSGI_WORKERS=2 UWSGI_THREADS=8 UWSGI_UID=1000 UWSGI_GID=2000 UWSGI_LAZY_APPS=1 UWSGI_WSGI_ENV_BEHAVIOR=holy

#COPY docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf
#EXPOSE 8000

# Copy db init script
#COPY init_db.sql /docker-entrypoint-initdb.d/

#ENTRYPOINT ["/jclock/entrypoint.sh"]
