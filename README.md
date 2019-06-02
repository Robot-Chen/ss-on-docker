# ss-on-docker
install shadowsocks on docker

### how to build 

```
docker build -t peacheychen/ss-on-docker .
```

### how to run

1.with default json config file
```
docker run -d -n shadowsocks -p 20196:20196 --restart peacheychen/ss-on-docker 
```

2. or customize the parameter by yourself
```
docker run -d --name ss2 -p 22223:22223 peacheychen/ss-on-docker -s 0.0.0.0 -p 22223 -k test4chen -m rc4-md5 --restart
```
