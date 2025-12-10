FROM alpine:latest

# 安装必要软件
RUN apk update && \
    apk add --no-cache \
    openssh-server \
    openssh-client \
    bash \
    vim \
    curl \
    wget \
    sudo \
    htop

# 配置SSH
RUN ssh-keygen -A && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# 设置root密码（默认，可在运行时覆盖）
RUN echo 'root:alpine' | chpasswd

# 创建数据目录
RUN mkdir -p /data && chmod 777 /data

# 暴露SSH端口
EXPOSE 22

# 启动SSH服务
CMD ["/usr/sbin/sshd", "-D", "-e"]