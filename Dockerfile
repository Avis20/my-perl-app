FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    nginx-extras \
    libcatalyst-perl \
    libcatalyst-devel-perl \
    libmoose-perl \
    libcatalyst-plugin-static-simple-perl \
    libcatalyst-plugin-configloader-perl \
    libcatalyst-action-renderview-perl

RUN apt-get update && apt-get -y -qq install --no-install-recommends \
    xotcl-shells expect-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /MyApp
COPY project /MyApp

COPY proxy/nginx.conf /etc/nginx/conf.d/default.conf

CMD unbuffer perl /MyApp/script/myapp_server.pl -rd -p $PORT

