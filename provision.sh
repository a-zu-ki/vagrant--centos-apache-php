sudo yum -y install httpd
sudo mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak 
sudo cp /vagrant/resources/httpd.conf /etc/httpd/conf/
sudo cp /vagrant/resources/deflate.conf /etc/httpd/conf.d/
sudo mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak
sudo chown -R vagrant /var/www
sudo chown -R vagrant /var/www/html
sudo ln -s /usr/bin/perl /usr/local/bin/perl
sudo rm -rf /var/www/html
sudo ln -fs /vagrant/html /var/www/html

#php5.6
sudo rpm -Uvh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo yum -y install --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof

#mysql
sudo yum -y install http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
sudo yum -y install mysql-community-server

#composer
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
export PATH=$PATH:/usr/local/bin

#laravel
#composer global require "laravel/installer=~1.1"
#export PATH=$PATH:~/.composer/vendor/bin
cd /var/www/
composer create-project laravel/laravel --prefer-dist laravel
#laravel new laravel
sudo mv /var/www/laravel/* /vagrant/laravel/
sudo rm -rf /var/www/laravel/
sudo ln -fs /vagrant/laravel /var/www/laravel


#apache start
sudo /etc/rc.d/init.d/httpd start
sudo chkconfig httpd on

#mysql start
sudo chkconfig mysqld on
sudo service mysqld restart

