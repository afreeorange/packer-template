Packer Template for CentOS 7
============================

Uses [Packer](https://www.packer.io) to build a sample CentOS 7 image for three platforms: Amazon EC2, Docker, and VirtualBox.

Usage
-----

Edit the `variables` section of `generate-centos7-images.json` first. Then,

    packer build generate-centos7-images.json

You will need installations of VirtualBox and Docker on your system. Tested on a Windows 10 machine with no issues. Docker

ToDo
----

* [ ] Fix `users.sh`

References
----------

* [Official Packer Docs](https://www.packer.io/docs/)
* [`shiguredo`'s Packer Template samples](https://github.com/shiguredo/packer-templates/tree/develop/centos-7.1). Don't work but are a good reference.
* Using [a public IP when building an AMI](http://blog.awolski.com/building-an-aws-ami-with-packer/)

License
-------

MIT

