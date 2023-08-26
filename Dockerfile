FROM ubuntu:23.10

ENV OSRM_ALGORITHM=mld \
    OSRM_THREADS=2 \
    OSRM_PORT=5000 \
    OSRM_PROFILE=/opt/car.lua \
    OSRM_MAP_NAME= \
    OSRM_GEOFABRIK_PATH= \
    OSRM_NOTIFY_FILEPATH= \
    PATH=$PATH:/usr/local/bin/osrm/

# # Add requirements and install application
RUN set -ex;
RUN apt-get update -q;
RUN apt-get install -y --allow-unauthenticated
RUN apt-get install -y curl
RUN apt-get install -y inotify-tools
RUN apt-get install -y wget
RUN rm -rf /var/lib/apt/lists/*;
RUN useradd --uid 5001 --create-home osrm;
RUN mkdir -p /data;
RUN chown -R osrm:osrm /data

WORKDIR /home/osrm
RUN wget https://github.com/Project-OSRM/osrm-backend/releases/download/v5.27.1/node_osrm-v5.27.1-node-v108-linux-x64-Release.tar.gz
RUN tar zxf node_osrm-v5.27.1-node-v108-linux-x64-Release.tar.gz
RUN mv binding/ /usr/local/bin/osrm
RUN rm -rf /home/osrm

USER osrm:osrm
WORKDIR /home/osrm

VOLUME [ "/data" ]

COPY --chown=osrm:osrm ./entrypoint.sh /home/osrm

ENTRYPOINT ["/home/osrm/entrypoint.sh"]
CMD ["run"]

# Arguments to label built container
ARG VCS_REF
ARG BUILD_DATE
ARG VERSION=v5.24.0