#!/bin/bash

#  arrêt et suppression d'un précédent container
docker container stop $(docker ps -aq) || true

docker container rm $(docker ps -aq)

# instantiation de l'image rabbit-mspoc:latest
docker run -d --hostname mspoc-rabbit --name mspoc-rabbit -p 5672:5672 -p 5673:5673 -p 15672:15672 rabbit-mspoc:latest  


