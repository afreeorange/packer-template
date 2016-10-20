yum -y install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm \
    http://repo.mysql.com//mysql57-community-release-el7-8.noarch.rpm \
    https://centos7.iuscommunity.org/ius-release.rpm

cat > /etc/yum.repos.d/nginx.repo <<NGINX_CONFIG
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/x86_64/
gpgcheck=0
enabled=1
NGINX_CONFIG

cat > /etc/yum.repos.d/docker.repo <<DOCKER_CONFIG
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
DOCKER_CONFIG

curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -

# Disable IUS for all packages (only want a few)
sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/ius-archive.repo
sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/ius-dev.repo
sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/ius.repo
sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/ius-testing.repo

