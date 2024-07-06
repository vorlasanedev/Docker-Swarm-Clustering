# Docker-Swarm-Clustering for support many reuest
https://www.youtube.com/watch?v=x3-VWaqWG_M

nodejs use pm2 to create many nod to process
1. initail js
```
npm init -y
npm install
```
- install express package
```
npm install express
```
- create app.js
2. run server
```
node app.js
```
<p><img src="screenshort\docker swarm.png"></p>

- testing using curl
<p><img src="screenshort\curl.png"></p>

3. Add project node to docker
- ctrl + p
```
>add dockerfile
```
- select: nodejs
- select: package.json
- select port: 3000
- select: yes
<p><img src="screenshort\add docker.png"></p>

## create docker with
- build image
```
docker build -t imagename:1.0 .

ex:
docker build -t cluster:1.0 .
```
<p><img src="screenshort\docker image.png"></p>

## run docker image (stand alone)

- docker run -d(background) -p(port) 9100:9100 --name nodeswarm cluster(image name)
docker run -d -p 9100:9100 --name nodeswarm your-app-name
```
docker run -d -p 9100:9100 --name cluster cluster:1.0
```


## create docker swarm (run docker swarm)
```
docker swarm init
```
- format: docker service create --replicas 3 --name <servicename> --publish 9100:9100 <imagename:tag>
```
docker service create --replicas 3 --name clusterservice --publish 9100:9100 cluster:1.0
```

## docker stop swarm (can not stop)
```
docker stop clusterservice.1.m59v48hbc7ocwce57m6i33ojp clusterservice.2.v7a324ll5hkbhnhh06hdmoj4y clusterservice.3.ki0str8ggzzna8kdrejyuuiag

```
## you can remove service
```
docker service ls
docker service rm 
```


## delete container
```
docker ps -a
docker rm <container_id>
```


## docker remove image
- stop docker
```
docker stop d32c02149be5
```
- remove docker container
```
docker images

docker rmi <image_id> -f
```



## check node version in docker
```
docker run --rm node:lts-alpine node -v
```