cd /tmp

# Set timezone to UTC
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/UTC /etc/localtime

# I don't want arguments about this
echo -e 'EDITOR=vim' >> /etc/environment
