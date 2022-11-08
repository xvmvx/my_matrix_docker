# 更新 Linux
sudo apt update && sudo apt upgrade
# 安装 docker
# Ubuntu：https://docs.docker.com/engine/install/ubuntu/ Debian：https ://docs.docker.com/engine/install/debian/

# 安装 docker-compose
sudo apt install docker && sudo apt install docker-compose
# 创建 docker 网络
# 这将允许我们为 docker 容器设置静态 IP。
sudo docker network create --driver=bridge --subnet=10.10.10.0/24 --gateway=10.10.10.1 dockernet
# 创建目录以在其中存储卷。
cd /home
sudo mkdir nginxmanager
cd nginxmanager
sudo mkdir data
sudo mkdir letsencrypt
sudo mkdir sql
vim docker-compose.yaml 文件
sudo nano docker-compose.yaml
使用以下模板：

version: "3"
services:
  app:
    image: jc21/nginx-proxy-manager:2
    restart: always
    ports:
      # Public HTTP Port:
      - '80:80'
      # Public HTTPS Port:
      - '443:443'
      # Admin Web Port:
      - '81:81'
    networks:
      default:
        ipv4_address: 10.10.10.3
    volumes:
      - /home/USER/nginxmanager/config.json:/app/config/production.json
      - app-data:/data
      - app-letsencrypt:/etc/letsencrypt
    depends_on:
      - db
  db:
    image: jc21/mariadb-aria:10.4
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 'npm'
      MYSQL_DATABASE: 'npm'
      MYSQL_USER: 'npm'
      MYSQL_PASSWORD: 'npm'
    networks:
      default:
        ipv4_address: 10.10.10.2
    volumes:
      - app-sql:/var/lib/mysql


volumes:
  app-data:
     driver_opts:
           type: none
           device: /home/USER/nginxmanager/data
           o: bind  
  app-letsencrypt:
     driver_opts:
           type: none
           device: /home/USER/nginxmanager/letsencrypt
           o: bind
  app-sql:
     driver_opts:
           type: none
           device: /home/USER/nginxmanager/sql
           o: bind
networks:
  default:
    external:
      name: dockernet
将“USER”替换为您的用户名（有 4 个）。

创建 config.json
sudo nano config.json
使用以下模板：

{
  "database": {
    "engine": "mysql",
    "host": "db",
    "name": "npm",
    "user": "npm",
    "password": "npm",
    "port": 3306
  }
}
启动 docker 容器
sudo docker-compose up -d
访问网页界面
前往http://SERVER-IP:81

默认登录：

Email: admin@example.com
Password: changeme
