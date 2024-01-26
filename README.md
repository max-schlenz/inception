# Inception Project

## Introduction
Inception is a system administration project focused on virtualizing multiple services using Docker. This project requires setting up a small infrastructure composed of different services under specific rules, all within a virtual machine.

## Features
- **Dockerized Services**: Setting up containers for NGINX, WordPress + php-fpm, and MariaDB.
- **Volumes**: Implementing volumes for WordPress database and website files.
- **Networking**: Establishing a Docker network for container communication.
- **TLS Configuration**: Configuring NGINX with TLSv1.2 or TLSv1.3.
- **Domain Name Setup**: Configuring a domain name pointing to the local IP address.
- **Environment Management**: Utilizing environment variables and `.env` files for configuration.
- **Bonus Features**:
  - Redis cache for WordPress.
  - FTP server container for WordPress website.
  - Static website (non-PHP) showcasing skills or portfolio.
  - Adminer setup.
  - Additional useful service of your choice.

## Requirements
- Docker and Docker Compose

## Installation and Usage
1. Clone the repository: `git clone [your-repo-link]`
2. Compile the project: `make`
3. Run the application: `docker-compose up -d`

## Technologies Used
- Docker and Docker Compose
- Virtual Machine for hosting the Docker environment
- Networking and Security configurations
