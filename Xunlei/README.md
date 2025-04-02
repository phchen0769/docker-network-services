# README

## Download docker image

```bash
docker pull cnk3x/xunlei:latest
```

## setting and running

```bash
docker run -d \
  --name=xunlei \
  -p 2345:2345 \
  -v /Volumes/myDriver/xunlei/config:/xunlei/data \
  -v /Volumes/myDriver/xunlei/downloads/:/xunlei/downloads \
  --restart=unless-stopped \
  --privileged \
  cnk3x/xunlei:latest
```
