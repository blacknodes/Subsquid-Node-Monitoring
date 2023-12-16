![image](https://github.com/blacknodes/subsquid-dashboard/assets/85839823/ee096020-5dfe-416d-a0b0-4716e5b8f21f)
# Subsquid-Node-Monitoring
## Install Prometheus And Grafana with Config
```
wget https://raw.githubusercontent.com/blacknodes/Subsquid-Node-Monitoring/main/setup_prometheus_grafana.sh
chmod +x setup_prometheus_grafana.sh
./setup_prometheus_grafana.sh
```
## Import Dashboard in Grafana
Open a web browser and navigate to http://<IP_ADDRESS>:3000, replacing <IP_ADDRESS> with your server ip.
Add a Prometheus Data Source and set url to http://localhost:9090 ![image](https://github.com/blacknodes/Subsquid-Node-Monitoring/assets/85839823/30d913cb-7022-4e5c-81f6-97f612a9c7c6)
  save it, and Import our dashoard.json file and youll see your Worker and server Status.
