# Tor relay in Docker

A Docker image with all dependencies required to use install a Tor relay network


## Installation


In order to use and build this Docker image you will need to Install the Docker
engine You can find installation instructions for your system
[here](https://docs.docker.com/engine/installation/#platform-support-matrix).


For further instructions on running Docker in Windows and Mac:
* [Docker for Windows documentation](https://docs.docker.com/docker-for-windows)
* [Docker for Mac documentation](https://docs.docker.com/docker-for-mac)


Clone the repository

```
git clone https://gitlab.com/cosmografo/tor-relay.git
```

Change directory

```
cd tor-relay
```


Relay configuration

```
ORPort 9001
DataDirectory /home/tor
ContactInfo none@none.com # change for your email
Nickname name-tor-relay # put here nickname tor relay
ExitRelay 0
SocksPort 0
ControlSocket 0

```


Create tor_data (owned as root)

```
sudo mkdir tor_data
```

Create separate network for Tor relay

```
docker network create --driver bridge tor_network
```

You can build the tor relay Docker image with the following command:


```
docker build -t cosmografo:tor-relay .
```

Run


```
docker run -d \
--network=tor_network \
-v /etc/localtime:/etc/localtime:ro \
-v $PWD/tor_data:/home/tor \
--restart always \
-p 9001:9001 \
cosmografo:tor

```
