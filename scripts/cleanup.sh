cd
truncate -s0 ~cloud-user/.ssh/authorized_keys
truncate -s0 ~cloud-user/.bash_history
truncate -s0 ~/.ssh/authorized_keys
truncate -s0 ~/.bash_history

package-cleanup -y --oldkernels --count=1
yum -y clean all
find /var/log/. -exec truncate -s0 {} \;
service rsyslog stop

rm -rfv /etc/ssh/*key*
rm -rfv /root/.cache/pip/*
rm -rfv /tmp/*
rm -rfv /var/log/*201* & rm -rf /var/log/*old*

sync
