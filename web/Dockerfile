# Pull base image
FROM python:3.7-slim

# Set work directory
RUN mkdir /jclock.co.uk
WORKDIR /jclock.co.uk

# Install build files
RUN apt-get update && apt-get install -y build-essential git

# Install dependencies
RUN git clone https://github.com/jayceelock/ScalewayWebsite.git
RUN pip install pipenv
WORKDIR /jclock.co.uk/ScalewayWebsite
RUN git checkout docker
RUN git pull origin docker
RUN pipenv install --system

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
