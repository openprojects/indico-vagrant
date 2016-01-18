Indico's Vagrant script
=======================

This code will create a new Centos 7 VM with latest Indico installation.


Requirements
------------

- Download and Install Vagrant on your Host machine:  https://www.vagrantup.com/downloads.html

- Download and Install Oracle VM VirtualBox: https://www.virtualbox.org/wiki/Downloads

- Download and Install VirtualBox Extension Pack (same above URL)

- Create a folder in your Host machine and: 
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
  $ vagrant ssh -c "/vagrant/opt/run_indico.sh"
```

- Now open your browser an point to the URL: http://0.0.0.0:8080


Fake SMTP server for debugging
------------------------------

Open a new shell, cd into indico-vagrant folder and
```
  $ vagrant ssh -c "python -m smtpd -n -c DebuggingServer localhost:8025"
```


Start Indico
-------------------

As already said:
```
  $ vagrant ssh -c "/vagrant/opt/run_indico.sh"
```
Indico will run in a VirtualEnv (/vagrant/opt).


Stop/start vagrant VM
---------------------

```
    $ vagrant halt
    $ vagrant up
```


pgAdmin access
------------------------------

Create a new DB connection with
```
  Name: indico-vagrant
  Host: 0.0.0.0
  Port: 5433
  Username: root
  no password needed
```
