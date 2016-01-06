Indico's Vagrant script
=======================

This code will create a new Centos 7 VM with latest Indico installation.

Lauch the Vagrant script with "vagrant up".

When finished, just run:

```
  vagrant ssh -c "/usr/bin/indico runserver"
```


From the Host, you should be able to get Indico by opening the URL: http://0.0.0.0:8080
