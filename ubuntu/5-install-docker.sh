curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "docker installed. logout to enable non-root user access"
