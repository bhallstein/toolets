# ubuntu--install-php.sh
#

echo 'ubuntu--install-php.sh'


# Add ondrej apt repo for PHP
apt-get update -y ;\
apt-get install software-properties-common -y ;\
add-apt-repository ppa:ondrej/php -y ;\
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C ;\

# Install other packages
apt-get update -y
DEBIAN_FRONTEND='noninteractive' apt-get install curl tzdata nano
DEBIAN_FRONTEND='noninteractive' apt-get upgrade -o Dpkg::Options::="--force-confnew" -y

# Set timezone
echo "Europe/London" > /etc/timezone
unlink /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# apache, mysql, php
echo "mysql-server mysql-server/root_password password $S_MYSQL_ROOT_PASS" > mysql_pwd_1
echo "mysql-server mysql-server/root_password_again password $S_MYSQL_ROOT_PASS" > mysql_pwd_2
debconf-set-selections < mysql_pwd_1
debconf-set-selections < mysql_pwd_2
DEBIAN_FRONTEND='noninteractive' \
  apt install apache2 -y \
    mysql-server \
    php7.2 php7.2-mysql libapache2-mod-php7.2 php7.2-mbstring php7.2-xml \
    imagemagick

