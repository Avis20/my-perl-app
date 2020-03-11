FROM ubuntu:bionic

RUN groupadd -r catalyst && useradd -rg catalyst catalyst

RUN apt-get update && apt-get install -y \
    nginx-extras \
    libcatalyst-perl \
    libcatalyst-devel-perl \
    libmoose-perl \
    libcatalyst-plugin-static-simple-perl \
    libcatalyst-plugin-configloader-perl \
    libcatalyst-action-renderview-perl

WORKDIR /MyApp
COPY project /MyApp

COPY proxy/nginx.conf /etc/nginx/conf.d/default.conf

CMD perl /MyApp/script/myapp_server.pl -rd -p $PORT

