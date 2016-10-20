# Update system and install packages
yum -y update
yum -y groupinstall "Development Tools"
yum -y install \
    bash-completion \
    byobu \
    bzip2-devel \
    curl-devel \
    docker-engine \
    expat-devel \
    gdb \
    htop \
    java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel \
    ncdu \
    opencv \
    openmpi \
    openssl-devel \
    perl \
    perl-devel \
    R-core \
    readline-devel \
    sqlite-devel \
    supervisor \
    the_silver_searcher \
    tree \
    valgrind \
    vim \
    wget \
    nginx \
    xz-devel \
    yum-utils \
    zlib-devel \
    postgresql95 \
    mysql-community-client \
    nodejs

# Miscellaneous stuff
yum -y remove git rsync
yum -y install rsync31u --enablerepo=ius
cd /tmp
wget -O - https://github.com/git/git/archive/v2.9.3.tar.gz | tar -xvzf -
cd git-2.9.3
make prefix=/usr/local/git install
echo 'export PATH=$PATH:/usr/local/git/bin' > /etc/profile.d/git.sh
source /etc/profile.d/git.sh

# Set up and install pyenv and Pythons 2 and 3 with AWS-CLI and Boto3
cd /tmp
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
echo -e 'export PYENV_ROOT="/opt/pyenv"' > /etc/profile.d/pyenv.sh
echo -e 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /etc/profile.d/pyenv.sh
source /etc/profile.d/pyenv.sh
echo -e 'eval "$(pyenv init -)"' >> /etc/profile.d/pyenv.sh
echo -e 'eval "$(pyenv virtualenv-init -)"' >> /etc/profile.d/pyenv.sh
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
source /etc/profile.d/pyenv.sh
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 2.7.12
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.5.2
pyenv global 2.7.12 && pip install awscli boto3
pyenv global 3.5.2 && pip install awscli boto3
echo -e "complete -C '/opt/pyenv/shims/aws_completer' aws" > /etc/profile.d/awscli.sh
source /etc/profile.d/awscli.sh
