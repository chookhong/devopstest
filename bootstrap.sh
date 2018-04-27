#!/bin/bash
vagrant up
export SSHPASS="testing"
sshpass -e vagrant ssh -c 'cd ~ && wget http://releases.ubuntu.com/16.04/ubuntu-16.04.4-server-i386.iso && tar -czf ubuntu-16.04.4-server-i386.iso.tar.gz ubuntu-16.04.4-server-i386.iso && export SSHPASS="testing" && sshpass -e scp -o StrictHostKeyChecking=no ubuntu-16.04.4-server-i386.iso.tar.gz testing@api.server:/home/testing' deploy.server -- -l testing
