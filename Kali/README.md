#

## 自定义镜像

```bash
git clone https://github.com/tsumarios/Kali-Linux-Dockerfile  # 克隆含工具的自定义镜像仓库 
cd Kali-Linux-Dockerfile
docker build -t kali-custom .             # 构建包含 nmap、metasploit 等工具的镜像 
```

## 运行

```bash
docker run --network=host -it -p 80:80 -v ~/kali_data:/root --name kali kalilinux/kali-rolling
```

## 安装配置源

```bash
# 替换阿里云镜像源加速
echo "deb https://mirrors.aliyun.com/kali kali-rolling main non-free contrib" > /etc/apt/sources.list 
apt update && apt upgrade -y
apt install -y nmap metasploit-framework hydra  # 安装常用工具 
```

## zsh

```bash
apt install -y zsh && chsh -s /bin/zsh      # 切换默认 Shell 为 Zsh 
```
