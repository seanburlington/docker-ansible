# This works for me

NB I already have some prequisits

the puppet code is the same as I was using in vagrant

## build image 

sudo docker build -t puppet-base base-docker/ 

## run container with shared folder
sudo docker run --name=pup1 -d -h locvgtdrpmc11.vgt.vagrant   -v /home/sean/git/puppet2:/vagrant  puppet-base


## find IP

sudo docker inspect pup1 | grep -i ipad

## ssh on

ssh ansible@$ip

## run puppet

/home/ansible/run-puppet.sh 




