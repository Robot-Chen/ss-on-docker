# ss-on-docker
install shadowsocks using docker

## ONE-STEP WAY

pls ensure that you have configured the correct firewall 

```
wget --no-check-certificate -O installation.sh https://raw.githubusercontent.com/Robot-Chen/ss-on-docker/master/installation.sh  && chmod +x installation.sh && sudo ./installation.sh
```
for client example configuration

```
{
    "server":"0.0.0.0",
    "server_port":20196,
    "local_port":1080,
    "password":"passw0rd",
    "timeout":600,
    "method":"aes-256-cfb"
}
```

## OR using the step by step way

### Step 1 -- install docker 

for Ubuntu, pls refer to this guide

https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-convenience-script

```
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
```

### Step 2 -- build 

- clone my project and then enter the project 

```
docker build -t peacheychen/ss-on-docker .
```

### Step 3 -- run

1.with default json config file
```
docker run -d --name shadowsocks -p 20196:20196 --restart="always" peacheychen/ss-on-docker 
```

2. or customize the parameter by yourself
```
docker run -d --name ss2 -p 22223:22223  --restart="always" peacheychen/ss-on-docker -s 0.0.0.0 -p 22223 -k test4test -m rc4-md5
```

