FROM python:3.6

WORKDIR /code

RUN pip install --upgrade google-cloud-speech

COPY . .
