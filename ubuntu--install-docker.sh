# ubuntu--install-docker.sh
#
# Docker installation. Tested on ubuntu 16.04 xenial.
#

echo 'install-docker.sh'

apt-get update

DEBIAN_FRONTEND='noninteractive' apt-get upgrade -o Dpkg::Options::="--force-confnew" -y
DEBIAN_FRONTEND='noninteractive' apt-get install apt-transport-https
DEBIAN_FRONTEND='noninteractive' apt-get install ca-certificates
DEBIAN_FRONTEND='noninteractive' apt-get install curl
DEBIAN_FRONTEND='noninteractive' apt-get install software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"

apt-get update
apt-get install -y docker-ce

