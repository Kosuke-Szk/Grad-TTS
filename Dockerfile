# Base image
FROM nvcr.io/nvidia/pytorch:22.01-py3

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# language conf
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV PYTHONIOENCODING "utf-8"

# Install necessary modules
RUN apt-get update -y --allow-unauthenticated && \
    apt-get install -y vim gcc git wget

RUN mkdir /opt/app
WORKDIR /opt/app

ADD requirements.txt /opt/app/requirements.txt
RUN python -m pip install pip --upgrade \
    && python -m pip install -r requirements.txt

RUN python -m pip install numpy --upgrade

ADD . /opt/app
