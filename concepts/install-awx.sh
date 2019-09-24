# install docker & container-selinux
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.74-1.el7.noarch.rpm # version tested
sudo yum --enablerepo=rhui-REGION-rhel-server-extras install container-selinux -y # amazon-specific
sudo yum install docker-ce -y
sudo systemctl start docker

# install ansible
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
sudo yum install ansible -y

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py

# install docker compose (python library)
sudo rm -rf /usr/lib/python2.7/site-packages/requests*
sudo pip install docker-compose

# install the repo
sudo yum install git -y
git clone https://github.com/ansible/awx.git

# start docker
sudo systemctl start docker

# run playbook
cd awx/installer/ && sudo ansible-playbook install.yml -i inventory && cd ../../
