#!/bin/bash

# 基于环境变量动态修改配置
if [ -n "$FTP_PASSWORD" ]; then
    echo "ftpuser:$FTP_PASSWORD" | chpasswd
fi

PASV_ADDRESS=$(ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftpd/vsftpd.conf

# 启动 vsftpd 服务
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
