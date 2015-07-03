sudo yum -y install httpd
sudo mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak 
sudo cp /vagrant/resources/httpd.conf /etc/httpd/conf/
sudo cp /vagrant/resources/deflate.conf /etc/httpd/conf.d/
sudo mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak
sudo chown -R vagrant /var/www/html
sudo ln -s /usr/bin/perl /usr/local/bin/perl
sudo rm -rf /var/www/html
sudo ln -fs /vagrant/html /var/www/html
sudo yum -y install php php-mbstring php-mysql
sudo /etc/rc.d/init.d/httpd start
sudo chkconfig httpd on

