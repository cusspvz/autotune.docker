FROM alpine:edge
MAINTAINER José Moreira <jose.moreira@findhit.com>
ADD tunesys /tunesys
RUN apk add --update docker; \
    chmod +x /tunesys/run /tunesys/common /tunesys/tuner/*
ENV PROC=/proc

# CACHE
ENV TUNE_CACHE=1 \
    cache_loop_interval=60 \
    sys__vm__drop_caches=3

# TCP
ENV TUNE_TCP=1 \
    tcp_loop_interval=3600 \
    net__ipv4__ip_local_port_range_min=15000 \
    net__ipv4__ip_local_port_range_max=61000 \
    net__ipv4__tcp_fin_timeout=20 \
    net__ipv4__tcp_tw_recycle=1 \
    net__ipv4__tcp_tw_reuse=1 \
    net__ipv4__tcp_max_orphans=0

# DOCKER_IMAGES
ENV TUNE_IMAGES=1 \
    images_loop_interval=86400

# DOCKER_CONTAINERS
ENV TUNE_CONTAINERS=1 \
    containers_loop_interval=21600

WORKDIR /tunesys
CMD [ "/tunesys/run" ]
