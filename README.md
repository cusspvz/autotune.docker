# autotune.docker

:wrench: autotune is a MUST HAVE (2MB) system tuner for ALL your docker hosts

Most Linuxes available over there aren't tuned to be high performance network
servers, thats why every tech company needs an Ops or Sysadmin guy.

Well, this docker image won't replace that role on your company, but will make
Ops easier for those who work with **Containers** and lots, Lots or LOTS of
machines!

# What it does?

It has built-in configurable tuners that handles minor settings, such as:
  * CACHE - drops kernel's cache
    - Linux ate your RAM? This reduces linux fs cache footprint
    - This isn't One Shot, it will act every 60 secs (interval also configurable)
  * TCP - sets up best tcp settings for high performance servers
    - Replaces hand `sysctl ...` configurations
    - Tunes settings every hour
    - This isn't One Shot, it will act every hour (interval also configurable)
  * Docker
    - Removes all images that are not being used
    - Removes all stoped containers


## Deploying

```bash
docker run -d \
    --privileged \ # to tune kernel settings
    --net host \ # to tune host network
    --volume /var/run/docker.sock:/var/run/docker.sock \ # to remove images and container's
    cusspvz/autotune
```


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
