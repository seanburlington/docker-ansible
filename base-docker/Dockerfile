# base
#
# VERSION               0.0.1

FROM centos:6
MAINTAINER Sean Burlington <sean@practicalweb.co.uk>

# setup sshd,  ensuring it runs through regular configs once - this does some initial setup
RUN yum -y update && yum -y install openssh-server
RUN service sshd start && service sshd stop

# create ansible user with sudo and public key
RUN yum -y install sudo
RUN useradd ansible
RUN echo 'ansible:D\N5Vlucg7,JlUhiDb<N' | chpasswd
ADD etc/sudoers/ansible /etc/sudoers.d/
RUN mkdir -p /home/ansible/.ssh/
ADD home/ansible/.ssh/authorized_keys /home/ansible/.ssh/
RUN chown -R ansible:ansible /home/ansible/ && chmod 700 /home/ansible/.ssh/ && chmod 600 /home/ansible/.ssh/authorized_keys


# set example env variable that will be visible in users shell
RUN echo "export VISIBLE=now" >> /etc/profile

ADD etc/yum.repos.d/puppet.repo /etc/yum.repos.d/ 
ADD home/ansible/run-puppet.sh /home/ansible/run-puppet.sh 

RUN yum -y install puppet-3.5.1 facter ruby-shadow

VOLUME ["/vagrant"]

RUN yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

 

# run sshd and expose it 
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
