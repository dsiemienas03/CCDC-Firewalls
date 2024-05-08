FROM ubuntu:latest

# Add user
RUN set -ex ;\
    useradd -ms /bin/bash ansible

WORKDIR /home/ansible

RUN set -ex ;\
    apt-get update --no-install-recommends ;\
    apt-get install -y ;\
    apt-get install -y ansible ;\
    apt-get purge -y --auto-remove


RUN set -ex ;\
    mkdir palo ;\
    mkdir cisco ;\
    mkdir config ;\
    mkdir pfsense ;\
    pip install --requirements config/requirements.txt ;\
    ansible-galaxy collection install -r config/requirements.yml

COPY config/* config/
COPY palo/* palo
COPY cisco/* cisco
COPY pfSense/* pfsense

# ENTRYPOINT [ "" ]
