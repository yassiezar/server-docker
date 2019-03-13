# Pull base image
FROM python:3.7-slim

# Set work directory
RUN mkdir /jclock
WORKDIR /jclock

# Install build files
RUN apt-get update && apt-get install -y build-essential

# Install dependencies
RUN pip install pipenv
COPY ScalewayWebsite/Pipfile ScalewayWebsite/Pipfile.lock /jclock/ScalewayWebsite/
WORKDIR /jclock/ScalewayWebsite
RUN pipenv install --system
WORKDIR /jclock

# Copy project
COPY ./ScalewayWebsite/ /jclock/

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
