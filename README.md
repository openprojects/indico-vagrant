Indico's Vagrant script
=======================

This code will create a new Centos 7 VM with latest Indico installation.


Requirements
============

- Download and Install Vagrant on your Host machine:  https://www.vagrantup.com/downloads.html

- Download and Install Oracle VM VirtualBox: https://www.virtualbox.org/wiki/Downloads

- Download and Install VirtualBox Extension Pack (same above URL)

- Create a folder in you Host machine and: 
```
  $ git clone https://github.com/openprojects/indico-vagrant.git
```

- Cd into the newly created folder (indico-vagrant) and:
```
  $ vagrant up
```

- Go for a long coffee (or a beer)

- When finished, just run:
```
  $ vagrant ssh -c "/usr/bin/indico runserver"
```

- Now open your browser an point to the URL: http://0.0.0.0:8080
