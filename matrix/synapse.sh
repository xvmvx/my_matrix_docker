docker run -it --rm --mount type=volume,src=synapse-data,dst=/data -e SYNAPSE_SERVER_NAME=haoo.haoo.host -e SYNAPSE_REPORT_STATS=no matrixdotorg/synapse:latest generate

vim /var/lib/docker/volumes/synapse-data/_data/homeserver.yaml
