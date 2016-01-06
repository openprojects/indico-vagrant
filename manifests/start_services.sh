# Stop and disable Firewall
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# Start Postgresql
sudo service postgresql-9.4 start
sudo createuser -s root -U postgres
sudo createdb indico -U postgres

# Start Redis
sudo service redis start
sudo systemctl enable redis.service

# start Indico
cd /vagrant/opt/indico-src   
sudo zdaemon -C etc/zdctl.conf start
sudo indico db prepare

# Give Vagrant user I/O permissions 
chown -R vagrant /opt/indico

#cp /vagrant/apache_indico.conf /etc/httpd/conf.d/
#service httpd restart
