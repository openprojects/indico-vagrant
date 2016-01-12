# Install development tools
sudo yum -y group install "Development Tools"

# Install Epel package
sudo yum -y install epel-release

# Install Redis
sudo yum -y install redis php-pecl-redis

# Install setuptools
sudo yum -y install python-pip

# Upgrade pip
sudo pip install --upgrade pip

# Install Celery and Redis bundle
sudo pip install -U celery[redis]

# Those old versions are needed by Indico
sudo pip install redis==2.10.3
sudo pip install pytz==2014.10

# Install other dev libs required by Indico
sudo yum -y install psmisc zlib-devel openssl-devel bzip2-devel python-devel 
sudo yum -y install libxml2-devel libxslt-devel libffi-devel libjpeg-devel
sudo yum -y install mod_wsgi mod_xsendfile tex

# Install some missing stuff for PDF on-the-fly generation
sudo cp -R /vagrant/packages/commonstaff /usr/share/texlive/texmf/tex/latex/
sudo texhash

# Install and configure Postgresql 9.4
sudo yum -y localinstall http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-2.noarch.rpm
sudo yum -y install postgresql94-server postgresql94-devel postgresql94-contrib
sudo /usr/pgsql-9.4/bin/postgresql94-setup initdb
sudo cp -f /vagrant/confs/pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf
sudo chkconfig postgresql-9.4 on
export PATH=/usr/pgsql-9.4/bin/:$PATH

# Install Apache
sudo yum -y install httpd httpd-devel

# Download and install Maildump
#sudo pip install maildump
#sudo pip install --upgrade webassets


# Install and setup VirtualEnv
sudo pip install virtualenv
virtualenv /vagrant/opt

# Download latest Indico from github
sudo git clone https://github.com/indico/indico.git /vagrant/opt/indico-src

sudo git config --global url.https://github.com/.insteadOf git://github.com/
cd /vagrant/opt/indico-src

# start virtualenv
source ../bin/activate

# Install Indico's requirements and deps
sudo env "PATH=$PATH" pip install -r requirements.txt
sudo pip install -r requirements.dev.txt

sudo fab setup_deps
echo "/opt/indico" | sudo python setup.py develop_config
sudo yes | cp /vagrant/confs/etc/indico.conf /vagrant/opt/indico-src/etc/
#sudo yes | cp /usr/bin/indico /vagrant/opt/
sudo yes | cp /vagrant/manifests/run_indico.sh /vagrant/opt/
sudo chmod 777 /vagrant/opt/run_indico.sh


