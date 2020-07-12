#ansible-via-docker

## build image
    docker build --tag ansible-via-docker:latest .

## use image
first we test our installation

    docker run --rm ansible-via-docker:latest ansible --version

before running playbooks, we have to copy our key

    docker run --rm ansible-via-docker:latest ssh-copy-id -o StrictHostKeyChecking=no -i /root/.ssh/id_rsa.pub root@192.168.21.210

and finally we can run plays.

Therefore we use the workdir as a host volume. And we disable ANSIBLE_HOST_KEY_CHECKING, otherwise connection will be blocked by default 

    docker run --rm -v ${PWD}/workdir:/ansible -e ANSIBLE_HOST_KEY_CHECKING=False ansible-via-docker:latest ansible-playbook -i inventory.ini helloworld.yaml
