FROM debian

USER root

RUN \
  # install ansoble
  apt-get update && \
  apt install -y ansible && \
  # install some helpers
  apt install -y iputils-ping && \
  # generate SSH key
  apt-get install -y openssh-client && \
  ssh-keygen -q -f /root/.ssh/id_rsa -P "" -C "ansible-via-docker"

#COPY ./ansible/ansible.cfg /etc/ansible/ansible.cfg

#>>>>
#COPY ./keys/ssh-ansible /root/.ssh/id_rsa
#RUN chmod 700 /root/.ssh
#RUN chmod 600 /root/.ssh/id_rsa
#<<<<

RUN mkdir /ansible
WORKDIR /ansible
