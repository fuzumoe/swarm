FROM python:3.8.2

WORKDIR /usr/src/app

COPY swarm ./
RUN apt-get update && apt-get -y upgrade
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install --upgrade setuptools
RUN pip install --no-cache-dir -r requirements.txt

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone