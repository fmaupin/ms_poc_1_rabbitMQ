#!/bin/bash

# build image
./build.sh &>/dev/null

echo "[build image OK]"

# instantiation image
./run.sh &>/dev/null

echo "[run image OK]"

# check erreur(s) pour rabbitMQ server

# attente run serveur rabbitMQ...
greprc=-1
t_sleep=0 

# attente MAX : 30 secondes
while [[ $greprc -ne 0 ]]
do
    if [ $t_sleep -eq 30 ]
    then
        break
    fi

    sleep 2
    t_sleep=$((t_sleep + 2))

    docker logs mspoc-rabbit | grep "Server startup complete" &>/dev/null; greprc=$?
done

if [[ $greprc -eq 0 && $t_sleep -lt 30 ]] ; then
    echo "[check rabbitMQ server OK]"
else
    echo "[check rabbitMQ server KO]"
fi

# clean resources
docker rmi $(docker images -f "dangling=true" -q) &>/dev/null

echo "[clean resources]"
