# ubuntu--install-node.sh
#

echo 'ubuntu--install-node.sh'


curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get install -y nodejs
npm i -g npm
echo 'npm config set prefix ~/.npm-packages' >> /home/wbt/.profile
echo 'PATH=~/.npm-packages/bin:$PATH' >> /home/wbt/.profile

