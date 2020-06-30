# docker version

apt-get update \
&& apt-get install -y apt-transport-https \
&& curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
&& echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list \
&& apt-get update \
&& apt-get install -y kubectl curl wget apt-transport-https


curl -LO "https://get.helm.sh/helm-v2.16.9-linux-amd64.tar.gz"
curl -LO "https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz"
curl -LO "https://github.com/roboll/helmfile/releases/download/v0.119.0/helmfile_linux_amd64"
curl -LO "https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

mv kubectl /usr/local/bin/kubectl

tar -zxvf helm-v3.2.4-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm helm-v3.2.4-linux-amd64.tar.gz
rm -rf linux-amd64/

mv kind-$(uname)-amd64 /usr/local/bin/kind
mv helmfile_linux_amd64 /usr/local/bin/helmfile

chmod +x "/usr/local/bin/helm"
chmod +x "/usr/local/bin/kind"
chmod +x "/usr/local/bin/helmfile"
chmod +x "/usr/local/bin/kubectl"
