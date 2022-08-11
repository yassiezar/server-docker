# Pull base image
FROM python:3.6-slim

# Install build files
RUN apt-get update && apt-get install -y build-essential git python3-psycopg2 libpq-dev uwsgi-plugin-python3

# Install dependencies
RUN mkdir /jclock.co.uk
RUN git clone https://github.com/jayceelock/ScalewayWebsite.git /jclock.co.uk/
WORKDIR /jclock.co.uk/ScalewayWebsite/

RUN pip install pipenv uwsgi
RUN pipenv install --system

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
