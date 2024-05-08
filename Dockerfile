FROM ubuntu:latest

# Add user
RUN set -ex ;\
    useradd ansible -ms /bin/bash

WORKDIR /home/ansible

RUN set -ex ;\
    apt-get update --no-install-recommends ;\
    echo pwd ;\
    apt-get install -y --no-install-recommends \ 
    ansible \
    python3 \
    python3-pip ;\
    apt-get purge -y --auto-remove ;\
    rm -rf /var/lib/apt/lists/*

RUN set -ex ;\
    mkdir palo ;\
    mkdir cisco ;\
    mkdir pfsense ;\
    mkdir config 

COPY config/* ./config/
COPY palo/* ./palo/
COPY cisco/* ./cisco/
COPY pfSense/* ./pfsense

RUN set -ex ;\
    pip3 install --no-cache-dir -r config/requirements.txt ;\
    ansible-galaxy collection install -r config/requirements.yml


# ENTRYPOINT [ "" ]
