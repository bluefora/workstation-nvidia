FROM ghcr.io/ublue-os/silverblue-nvidia:latest


COPY build.sh /tmp/build.sh

COPY rootcopy /

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
    
