# **OSRM Backend** Docker image

Docker image for **OSRM Backend**.

## What is **OSRM Backend**

Open Source Routing Machine.

> [**OSRM Backend**](http://project-osrm.org/)

## Supported tags

[Dockerhub matrheusriios/osrm-backend](https://hub.docker.com/repository/docker/matrheusriios/osrm-backend/)

Tags:
-   `images/5.27/debian/Dockerfile`: 5.24.0-debian 5.24-debian 5.24.0 5.24 <!--+tags-->

## How to run this image

This image provides an OSRM Manager in the form of the Docker entrypoint.
It manages map downloads from Geofabrik and OSRM extraction/pre-processing/routing based on environment variables.

```shell
## mld or ch or corech
OSRM_ALGORITHM=mld

OSRM_THREADS=2

OSRM_PORT=5000

## Extraction profile
OSRM_PROFILE=/opt/car.lua

## OSRM map name
OSRM_MAP_NAME=berlin-latest

## Geofabrik relative path to download map
OSRM_GEOFABRIK_PATH=europe/germany/berlin-latest.osm.pbf

## File to modify to trigger OSRM reload when using command `start`
OSRM_NOTIFY_FILEPATH=/data/osrm_notify.txt
```

You can run `osrm-routed` in a detach mode by setting the command to `start`, and then use the file `$OSRM_NOTIFY_FILEPATH` to notify OSRM to restart.

See **OSRM Backend** base image documentation for more details.

> [**OSRM Backend** GitHub](https://github.com/Project-OSRM/osrm-backend)

> [**OSRM Backend** DockerHub](https://hub.docker.com/r/osrm/osrm-backend/)

## Questions / Issues

If you got any questions or problems using the image, please visit our [Github Repository](https://github.com/matheusriios/docker-osrm-backend/) and write an issue.