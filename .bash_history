clear
sudo apt update
sudo apt update -y
sudo apt upgrade -y
clear
sudo apt install git
sudo apt install wget
sudo apt install unzip
sudo apt install java
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version
openjdk version "17.0.13" 2024-10-15
OpenJDK Runtime Environment (build 17.0.13+11-Debian-2)
OpenJDK 64-Bit Server VM (build 17.0.13+11-Debian-2, mixed mode, sharing)
java -version
clear
sudo apt install maven -y
maven --version
mvn --version
clear
ls
cd
ls -a
clear
jenkins --version
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]"   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
jenkins --version
clear
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
clear
cat /var/lib/jenkins/secrets/initialAdminPassword
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
clear
clear
sudo ./get_helm.sh
ls
sudo ./get_helm.sh
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh
helm version --client
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
kubectl version
kubectl version --client
sudo apt-get install -y kubectl
sudo apt install kubectl
sudo apt install kubectl -y
clear
cd nano
cd /etc/
ls
cd
clear
sudo vi /etc/hosts
sudo systemctl restart nscd
sudo systemctl restart
systemctl status nscd
ping jenkins
sudo vi /etc/hosts
sudo systemd-resolve --flush-caches
clear
clear
[200~curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
sudo apt install unzip
aws --version
clear
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
sudo apt install unzip
sudo unzip awscliv2.zip
sudo ./aws/install
aws --version
clear
aws --version
clear
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh
helm version --client
clear
helm --version
helm version
clear
cd ./
ls
clear
sudo ./get_helm.sh
helm -version
helm -v
helm --version
helm version --client
clear
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
kubectl version --client
kubectl version --short --client
clear
kubectl --version
sudo apt-get install -y kubectl
sudo apt install kubectl -y
clear
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update -y
clear
sudo apt-get update
clear
sudo apt-get install -y kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/stable/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client
clear
kubectl version --client
sudo rm -f /usr/local/bin/kubectl
LATEST_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -LO "https://dl.k8s.io/release/${LATEST_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client
clear
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
clear
helm version --client
sudo apt update
sudo apt install gnupg2 pass -y
sudo apt install docker.io -y
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
clear
sudo vi /etc/hosts
sudo hostnamectl set-hostname jenkins
sudo vi /etc/hosts
sudo reboot
clear
top
clear
sudo usermod -a -G docker jenkins
sudo service jenkins restart
sudo systemctl daemon-reload
sudo service docker stop
sudo service docker start
sudo service docker status
clear
clear
'
clear
aws ecr get-login-password --region ap-south-2 | docker login --username AWS --password-stdin 585008055705.dkr.ecr.ap-south-2.amazonaws.com/assignment-ecr-repo
aws configure
aws ecr get-login-password --region ap-south-2 | docker login --username AWS --password-stdin 585008055705.dkr.ecr.ap-south-2.amazonaws.com/assignment-ecr-repo
clear
sudo apt install -y git
clear
git config --global user.name "ymuralisanthosh"
git config --global user.email "santhosh.yaruva@gmail.com"
git config --list
clear
git clone https://github.com/ymuralisanthosh/whiteapp.git
clear
ls
cd whiteapp/
ls
docker build -t .
docker build .
ls
cd whiteapp/
ls
mvn --version
clear
mvn clean package
clear
ls
cd target/
ls
cp target/whiteapp-1.0-SNAPSHOT.jar application.jar
ls
docker build -t whiteapp-image .
clear
cd
cp target/whiteapp-1.0-SNAPSHOT.jar application.jar
ls
cd whiteapp/
ls
ls target/
cp target/white-app-1.0-SNAPSHOT.jar application.jar
docker build -t whiteapp-image .
docker run -p 8080:8080 whiteapp-image
docker run -p 8081:8080 whiteapp-image
target/white-app-1.0-SNAPSHOT.jar
ls
ls target/
cp target/white-app-1.0-SNAPSHOT.jar application.jar
ls
vi Dockerfile 
docker build -t whiteapp-image .
docker run -p 8081:8080 whiteapp-image
clear
ls
helm create assignment
tree assignment
ls
vi assignment/values.yaml 
clear
ls
cd assignment/
ls
tree
cd templates/
ls
apiVersion: apps/v1
kind: Deployment
metadata:
spec:
clear
ls
vi deployment.yaml 
vi service.yaml 
clear
ping jenkins
clear
ls
clear
aws configure
clear
