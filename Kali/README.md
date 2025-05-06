# README

## 自定义镜像

```bash
git clone https://github.com/tsumarios/Kali-Linux-Dockerfile  # 克隆含工具的自定义镜像仓库 
cd Kali-Linux-Dockerfile
docker build -t kali-custom .             # 构建包含 nmap、metasploit 等工具的镜像 
```

## 运行

```bash
# 开发环境下运行
docker compose --env-file=../dev.env up -d
```
