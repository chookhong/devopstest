# devopstest
This project is aimed to do the following:
* Create two CentOS 7 servers using Vagrant, one with hostname `deploy.server`, and another with hostname `api.server`. They should both be able to communicate with one another.
* Provision both servers with the account named `testing` with the password `testing`. This account must have sudo powers.
* SSH into `deploy.server` and then, download this file http://releases.ubuntu.com/16.04/ubuntu-16.04.4-server-i386.iso
* Compress this file using `tar.gz` and from the `deploy.server`, transfer the archive to the home directory of `api.server`'s testing account.

bootstrap.sh will trigger all tasks to complete the job.
