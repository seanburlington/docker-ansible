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

# run sshd and expose it 
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
