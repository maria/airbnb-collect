FROM centos/python-34-centos7:latest

USER root
WORKDIR /opt/

RUN yum install -y python-psycopg2 python-devel libxslt-devel && \
    curl -L -o airbnb.tar.gz https://github.com/maria/airbnb-data-collection/archive/v0.1.tar.gz && \
    tar zvfx airbnb.tar.gz && rm airbnb.tar.gz && \
    LD_LIBRARY_PATH=/opt/rh/rh-python34/root/usr/lib64 pip install psycopg2 requests lxml

ADD root.config ./airbnb-data-collection-0.1/

ADD start.sh ./
RUN chmod +x start.sh

ENTRYPOINT ./start.sh
