# 下载AList镜像
docker pull xhofe/alist:v3.40.0-ffmpeg

# 生成AList容器并运行
docker run --name alist -d \
  --restart=unless-stopped \
  -v /mnt/sda/alistServer/data:/opt/alist/data \
  -v /mnt/sda/alistServer/root:/opt/alist/root \
  -p 5244:5244 \
  -e PUID=0 \
  -e PGID=0 \
  -e UMASK=022 \
  -e "TZ=Asia/Shanghai" \
  xhofe/alist:v3.40.0-ffmpeg

# 参数说明：
/opt/alist/data 目录，用于存储alist程序本身的数据
/opt/alist/root 目录，用于对外共享数据

# 3.25.0以上版本将密码改成加密方式存储的hash值，无法直接反算出密码，如果忘记了密码只能通过重新 随机生成 或者 手动设置

# 随机生成一个密码
docker exec -it alist ./alist admin random
# 手动设置一个密码,`NEW_PASSWORD`是指你需要设置的密码
docker exec -it alist ./alist admin set NEW_PASSWORD