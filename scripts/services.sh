# Enable docker at startup and set up a sample proxy config

systemctl enable docker
systemctl start docker
systemctl daemon-reload

usermod -G docker cloud-user

mkdir /etc/systemd/system/docker.service.d
cat > /etc/systemd/system/docker.service.d/http-proxy.conf <<DOCKERPROXY
# An example of how you would configure a proxy if need be
#[Service]
#Environment="HTTP_PROXY=http://some.proxy"
DOCKERPROXY
