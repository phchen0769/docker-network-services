# SSH Server in Docker based on Alpine Linux

This repository contains a Docker setup for creating a custom SSH server based on Alpine Linux. The setup includes the ability to use static SSH host keys, configure SSH key and password authentication, and set up user-specific SSH key pairs.

[![Build](https://github.com/haravich/custom-ssh-server/actions/workflows/docker-image.yml/badge.svg)](https://github.com/haravich/custom-ssh-server/actions/workflows/docker-image.yml) ![Docker pulls](https://img.shields.io/docker/pulls/haravich/custom-ssh-server)

## Table of Contents

- [SSH Server in Docker based on Alpine Linux](#ssh-server-in-docker-based-on-alpine-linux)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Usage](#usage)
  - [Customization](#customization)
  - [License](#license)

## Introduction

This project provides a Dockerized environment for creating a custom SSH server with the following features:

- SSH key and password authentication
- User-specific SSH key pair generation

## Prerequisites

Before you begin, ensure you have the following installed:

- Docker: Follow the official [Docker installation guide](https://docs.docker.com/get-docker/) to install Docker on your system.

## Getting Started

1. **Clone the Repository**:

   Clone this repository to your local machine:

   ```bash
   git clone https://github.com/haravich/custom-ssh-server.git
   cd custom-ssh-server
   ```

2. **Customize Configuration**:

    Modify the setup-ssh-user.sh script to customize user creation and SSH key settings.
    Place your public key in the ssh-keys directory (needed).
    Customize the sshd_config file to adjust SSH server settings.

3. **Build and Run**:

    Build the Docker image and run the container:

    ```bash
    docker build -t custom-ssh-server .
    docker run -d -p 2222:22 -e SSH_USER=<desired_username> -e SSH_PASSWORD=<desired_password> custom-ssh-server

    (or)

    docker run -d -p 2222:22 -e SSH_USER=<desired_username> -e SSH_PUBLIC_KEY="<value_of_public_key> || $(cat /ssh-keys/*.pub)" custom-ssh-server

    (or)

    docker run -d -p 2222:22 -e SSH_USER=<desired_username> -e SSH_PASSWORD=<desired_password> -e SSH_PUBLIC_KEY="<value_of_public_key> | $(cat /ssh-keys/*.pub)" custom-ssh-server
    ```
    Replace <desired_username>, <desired_password> and <value_of_public_key> with appropriate values.

## Usage

To connect to the SSH server:

```bash
ssh -i /path/to/private_key_file -p 2222 <desired_username>@localhost
```
Replace /path/to/private_key_file and <desired_username> with appropriate values.

## Customization
* Adjust the SSH server settings in the sshd_config file.
* Customize the setup-ssh-user.sh script to modify user creation.

## License
This project is licensed under the [MIT License](LICENSE.md). See the [LICENSE.md](LICENSE.md) file for details.
```
Copy and paste this Markdown content into a file named README.md in the root of your repository. Feel free to adjust the formatting and content as needed for your project.
```