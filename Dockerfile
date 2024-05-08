FROM ubuntu


# Install required packages
RUN set -ex; \
    apt-get update && apt-get install -y; \
    apt-get install -y ansible; \
    apt-get purge -y --auto-remove


# Copy configurations
RUN mkdir /etc/config
COPY config/* /etc/config/

# Copy Ansible playbooks
RUN set -ex ;\
    mkdir palo ;\
    mkdir cisco ;\
    mkdir pfsense

COPY palo/* palo
COPY cisco/* cisco
COPY cisco/* cisco

# Copy Ansible galaxies
RUN ansible-galaxy collection install -r /etc/config/requirements.yml

# ENTRYPOINT [ "" ]
