docker run -d --name synapse --mount type=volume,src=synapse-data,dst=/data -p 8008:8008 -p 4143:443 matrixdotorg/synapse:latest
