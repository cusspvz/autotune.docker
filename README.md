# autotune.docker

:wrench: autotune is a MUST HAVE (2MB) system tuner for ALL your docker hosts

#### Sceptic? See it with your own eyes: 

![rancher-host-stats-autotune-launch](https://cloud.githubusercontent.com/assets/3604053/14365847/b66d2afc-fd07-11e5-9100-ec899b6814bf.png)

```yaml
# The image upwards showns stats from one host while receiving a deployment
# of the autotune.docker. Here is the configuration used on the deployment:

# docker-compose.yml 
autotune:
  environment:
    docker_remove_containers: '0'
    docker_remove_images: '1'
    net__ipv4__tcp_fin_timeout: '30'
    net__ipv4__tcp_max_orphans: '40000'
  tty: true
  image: cusspvz/autotune:1.1.1
  privileged: true
  volumes:
  - /var/run/docker.sock:/var/run/docker.sock
  stdin_open: true
  net: host
```


Most Linuxes available over there aren't tuned to be high performance network
servers, thats why every tech company needs an Ops or Sysadmin guy.

Well, this docker image won't replace that role on your company, but will make
Ops easier for those who work with **Containers** and lots, Lots or LOTS of
machines!

# What does it do?

It has built-in configurable tuners that handles minor settings, such as:
  * CACHE - drops kernel's cache
    - Linux ate your RAM? This reduces linux fs cache footprint
    - This isn't One Shot, it will act every 60 secs (interval also configurable)
  * TCP - sets up best tcp settings for high performance servers
    - Replaces hand `sysctl ...` configurations
    - Tunes settings every hour
    - This isn't One Shot, it will act every hour (interval also configurable)
  * Docker
    - Removes all images that are not being used. Option enable by default `docker_remove_images=1` in Dockerfile
    - Removes all stoped containers. Option enable by default `docker_remove_containers=1` in Dockerfile.


## Deploying

```bash
docker run -d \
    --privileged \ # to tune kernel settings
    --net host \ # to tune host network
    --volume /var/run/docker.sock:/var/run/docker.sock \
    cusspvz/autotune
```

## FAQ

### I'm getting an error stating the docker Cli and the API have different versions.

You can set the `DOCKER_API_VERSION` with the running API server and it should work fine.

## Motivation

During our firsts cluster deployments we encountered various issues regarding
providers (Azure and AWS) default Linux configurations.

Since isn't handy to do those kind of jobs, I've decided to create something
easy to manage over Environment Variables.


## Plans for the future

It would be nice to have automation based on server's current state.


## Developing

```bash
make test
```
