#!/bin/bash
##############################################################################
# linuxpostinstall.sh — Ubuntu VM post-deployment configuration
# Runs via Azure Custom Script Extension on the Linux VM.
# Installs common tools needed for the Cortex Cloud workshop labs.
#
# Usage: bash linuxpostinstall.sh <admin-username>
##############################################################################

set -e

ADMIN_USER="${1:-azadmin}"

echo ">>> Starting Linux post-install configuration for user: ${ADMIN_USER}"

# --- Update system packages ---
echo ">>> Updating system packages..."
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y

# --- Install essential packages ---
echo ">>> Installing essential packages..."
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  software-properties-common \
  jq \
  unzip \
  wget \
  net-tools \
  dnsutils \
  tree \
  python3-pip

# --- Install Azure CLI ---
echo ">>> Installing Azure CLI..."
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# --- Install Docker ---
echo ">>> Installing Docker..."
curl -fsSL https://get.docker.com | bash
usermod -aG docker "${ADMIN_USER}"
systemctl enable docker
systemctl start docker

# --- Install Docker Compose ---
echo ">>> Installing Docker Compose..."
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)
curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# --- Install kubectl ---
echo ">>> Installing kubectl..."
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" > /etc/apt/sources.list.d/kubernetes.list
apt-get update -y
apt-get install -y kubectl

# --- Install Helm ---
echo ">>> Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# --- Install shellinabox (web-based terminal on port 4200) ---
echo ">>> Installing shellinabox..."
apt-get install -y shellinabox
systemctl enable shellinabox
systemctl start shellinabox

# --- Create workshop directories ---
echo ">>> Creating workshop directories..."
mkdir -p /home/${ADMIN_USER}/workshop
chown ${ADMIN_USER}:${ADMIN_USER} /home/${ADMIN_USER}/workshop

# --- Pull sample vulnerable container images ---
echo ">>> Pulling sample container images..."
docker pull vulnerables/web-dvwa:latest || true
docker pull nginx:latest || true

echo ">>> Linux VM configuration complete."
echo ">>> Web terminal available at https://<vm-ip>:4200"
