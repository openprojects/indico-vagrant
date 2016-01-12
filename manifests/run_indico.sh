# Run maildump
if [ ! -f md.pid ]; then
    maildump --http-ip 0.0.0.0 --smtp-ip 0.0.0.0 --smtp-port 8025 -p md.pid
fi

# Run Zeo
sudo zdaemon -C /vagrant/opt/indico-src/etc/zdctl.conf restart

# Run Indico
sudo indico runserver