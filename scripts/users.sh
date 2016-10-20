cd /tmp

# Set up the following
# * rename the default user from 'centos' to 'cloud-user'
# * rename the default user's group
# * remove the default user's password
# * make sure the backups for /etc/shadow and /etc/password reflect the change

usermod -l cloud-user centos # the -d -m flags don't work :/
groupmod -n cloud-user centos
mv /home/centos /home/cloud-user
sed -i 's/centos/cloud-user/g' /etc/sudoers.d/90-cloud-init-users
sed -i 's/centos/cloud-user/g' /etc/cloud/cloud.cfg
sed -i 's/centos/cloud-user/g' /etc/passwd
sed -i 's/centos/cloud-user/g' /etc/passwd-
sed -i 's/.*centos.*/cloud-user:!!:17046:0:99999:7:::/' /etc/shadow
sed -i 's/.*centos.*/cloud-user:!!:17046:0:99999:7:::/' /etc/shadow-
