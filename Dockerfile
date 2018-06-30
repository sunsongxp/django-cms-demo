FROM python:3.6-alpine3.7

RUN echo "http://mirrors.aliyun.com/alpine/v3.6/main" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/v3.6/community" >> /etc/apk/repositories

RUN apk update
RUN apk add --no-cache make gcc g++

RUN apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev fribidi-dev
#harfbuzz-dev \

COPY pip.conf /root/.pip/pip.conf

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY . /app
