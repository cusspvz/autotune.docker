# tunesys

:wrench: TuneSYS is an auto system tuner for your docker host

Most Linuxes available over there aren't tuned to be high performance network
servers, thats why every tech company needs an Ops or Sysadmin guy.

Well, this docker image won't replace that role on your company, but will make
Ops easier for those who work with **Containers** and lots, Lots or LOTS of
machines!


## Motivation

During our firsts cluster deployments we encountered various issues regarding
providers (Azure and AWS) default Linux configurations.

Since isn't handy to do those kind of jobs, I've decided to create something
easy to manage over Environment Variables.


## Deploying

```bash
docker run -d --privileged cusspvz/tunesys
```


## Developing

```bash
make test
```
