sudo yum -y install httpd
sudo mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak 
sudo cp /vagrant/resources/httpd.conf /etc/httpd/conf/
sudo cp /vagrant/resources/deflate.conf /etc/httpd/conf.d/
sudo mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak
sudo chown -R vagrant /var/www/html
sudo ln -s /usr/bin/perl /usr/local/bin/perl
sudo rm -rf /var/www/html
sudo ln -fs /vagrant/html /var/www/html
sudo rpm -Uvh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo yum -y install --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof
sudo /etc/rc.d/init.d/httpd start
sudo chkconfig httpd on

