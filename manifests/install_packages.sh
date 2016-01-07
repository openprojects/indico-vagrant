# Install setuptools
sudo python /vagrant/manifests/get-pip.py

# Install development tools
sudo yum -y group install "Development Tools"

# Install Redis
sudo yum -y install /vagrant/packages/epel-release-7-5.noarch.rpm
sudo yum -y install redis php-pecl-redis


# Install Celery and Redis bundle
sudo pip install -U celery[redis]

# Those old versions are needed by Indico
sudo pip install redis==2.10.3
sudo pip install pytz==2014.10

# Install other dev libs required by Indico
sudo yum -y install psmisc zlib-devel openssl-devel bzip2-devel python-devel 
sudo yum -y install libxml2-devel libxslt-devel libffi-devel libjpeg-devel
sudo yum -y install git mod_wsgi mod_xsendfile tex

# Install some missing stuff for PDF on-the-fly generation
sudo cp -R /vagrant/packages/commonstaff /usr/share/texlive/texmf/tex/latex/
sudo texhash

# Install and configure Postgresql 9.4
sudo yum -y install /vagrant/packages/pgdg-redhat94-9.4-1.noarch.rpm
sudo yum -y install postgresql94-server postgresql94-devel postgresql94-contrib
sudo /usr/pgsql-9.4/bin/postgresql94-setup initdb
sudo cp -f /vagrant/confs/pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf
sudo chkconfig postgresql-9.4 on
export PATH=/usr/pgsql-9.4/bin/:$PATH

# Install Apache
sudo yum -y install httpd httpd-devel

# Download latest Indico from github
sudo git clone https://github.com/indico/indico.git /vagrant/opt/indico-src

sudo git config --global url.https://github.com/.insteadOf git://github.com/
cd /vagrant/opt/indico-src

# Install Indico's requirements and deps
sudo env "PATH=$PATH" pip install -r requirements.txt
sudo pip install -r requirements.dev.txt

sudo fab setup_deps
echo "/opt/indico" | sudo python setup.py develop_config
sudo yes | cp /vagrant/confs/etc/indico.conf /vagrant/opt/indico-src/etc/
sudo yes | cp /usr/bin/indico /vagrant/opt/


