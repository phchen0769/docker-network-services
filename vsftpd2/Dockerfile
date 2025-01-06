# 基础镜像
FROM alpine:latest

# 安装必要工具
RUN apk add --no-cache vsftpd openssl bash

# 添加默认用户和配置文件
RUN addgroup -g 433 -S ftpuser && \
    adduser -u 431 -D -G ftpuser -h /home/vsftpd/ftpuser -s /bin/false ftpuser && \
    chown -R ftpuser:ftpuser /home/vsftpd/ && \
    mkdir -p /etc/vsftpd/ && \
    echo "default configuration" > /etc/vsftpd/vsftpd-base.conf

# 拷贝启动脚本
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 默认命令
CMD ["/start.sh"]