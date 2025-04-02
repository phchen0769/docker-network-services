# README

## Download docker image

```bash
docker pull ngrok/ngrok:latest
```

## setting and running

```bash
docker run --rm -it -e NGROK_AUTHTOKEN=your_token ngrok/ngrok:latest http 8080
```
