#!/bin/bash

echo "🚀 Starting development environment automation..."

# 1. Update system (Ubuntu) and installing basic tools
echo "📦 Updating system and installing zip/unzip tool..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git zip unzip build-essential

# 2. Installing SDKMAN! - Maven - Java 21
if [ ! -d "$HOME/.sdkman" ]; then
	echo "☕ Installing SDKMAN!, Maven and Java 21..."
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk install java 21.0.2-tem
	sdk install maven
else
	echo "✅ SDKMAN! already installed."
fi

# 3. Installing NVM - Node.js - Angular 21
if [ ! -d "$HOME/.nvm" ]; then
	echo "🟢 Installin NVM, Node.js and Angular 21..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	nvm install --lts
	npm install -g @angular/cli@21
else
	echo "✅ NVM already installed."
fi

# 4. Creating structure to projects
echo "📁 Creating folders..."
mkdir -p ~/dev/infra
mkdir -p ~/dev/projects

# 5. Creating docker-compose.yml default
echo "🐋 Creating docker-compose.yml file to setup PostgreSQL..."
cat <<EOF > ~/dev/infra/docker-compose.yml
services:
  postgres-db:
    image: postgres:18-alpine
    container_name: postgres-db
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    ports:
      - "127.0.0.1:5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
    networks:
      - pg-network

  pgadmin:
    image: dpage/pgadmin4
    container_name: pgadmin
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@admin.com
      PGADMIN_DEFAULT_PASSWORD: admin
    ports:
      - "127.0.0.1:9100:80"
    depends_on:
      - postgres-db
    networks:
      - pg-network

networks:
  pg-network:
    driver: bridge

volumes:
  pgdata:
EOF

echo "✅ Development Environment configured with success!"
echo "⚠️ Reset the terminal or run 'source ~/.bashrc' to apply changes."
