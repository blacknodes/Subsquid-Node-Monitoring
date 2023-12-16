#!/bin/bash

# Prompt the user for input
read -p "Enter your server IP address: " server_ip
read -p "Enter your worker port: " worker_port

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl software-properties-common

# Add Grafana GPG key and repository
sudo curl https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

# Add Prometheus repository
sudo curl -s https://packagecloud.io/install/repositories/prometheus-rpm/release/script.deb.sh | sudo bash

# Install Prometheus and Grafana
sudo apt-get update
sudo apt-get install -y prometheus grafana

# Configure Prometheus targets
cat <<EOF > /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node-exporter'
    static_configs:
      - targets: ['$server_ip:9100']

  - job_name: 'worker'
    static_configs:
      - targets: ['$server_ip:$worker_port']
EOF

# Restart Prometheus to apply changes
sudo systemctl restart prometheus

# Enable and start Grafana
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo "Prometheus and Grafana have been installed and configured."
