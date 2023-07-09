# DNSCat2 Docker Image 

Docker image for *[DNSCat2](https://github.com/iagox86/dnscat2)*.

## Supported tags and respective `Dockerfile` links

- [`0.07-r0`, `latest`](https://github.com/dmachard/docker-dnscat2/tree/main/0.07)

## How to use this image

Two modes of execution is available:
- `client`
- `server`

### Client mode

```
sudo docker run -it --rm dmachard/dnscat2:latest client
```

### Server mode

```
sudo docker run -it --rm dmachard/dnscat2:latest server
```

## How to build

```
sudo docker build -t dnscat2 .
```