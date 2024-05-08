FROM ubuntu:latest


# Install required packages
RUN set -ex; \
    apt-get update --no-install-recommends ;\
    apt-get install -y; \
    apt-get install -y ansible; \
    apt-get purge -y --auto-remove


# Copy configurations

# Copy Ansible playbooks
RUN set -ex ;\
    mkdir palo ;\
    mkdir cisco ;\
    mkdir /etc/config ;\
    mkdir pfsense ;\
    mkdir /etc/panos

COPY config/* config/
COPY palo/* palo
COPY cisco/* cisco
COPY pfSense/* pfsense
COPY submodules/pan-os-ansible/* /etc/panos
RUN ansible-galaxy collection install -p /etc/panos/galaxy.yml


# RUN ansible-galaxy collection install -r /etc/config/requirements.yml



# ENTRYPOINT [ "" ]
