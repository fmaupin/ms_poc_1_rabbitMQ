## projet ms-poc-1-rabbitMQ

L'objectif de ce projet est de déployer un broker de messages (rabbitMQ) sous forme d'image Docker.

Le broker doit être paramétré selon les besoins du projet ms-poc-1.

### Image & container Docker

https://hub.docker.com/_/rabbitmq

script "buil.sh" -> construction image

Cf. pour plus de détails fichiers "*Dockerfile*", "*definitions.json*" & "*rabbitmq.config*"

script "run.sh" -> instantiation image (container)

Vérification :
```
docker container ls

docker logs mspoc-rabbit
```

### Monitoring broker

monitoring console : http://localhost:15672

username/password -> définis dans fichier "*definitions.json*"

script "*hash_pwd*" pour définir password user

### vhost, exchange, queues

Ces informations sont automatiquement implémentées lors de la création du container.

https://www.rabbitmq.com/tutorials/amqp-concepts.html

Delivery mode messages vers queues -> Direct exchange routing

vhost créé -> 'mspoc'

user -> set permissions pour vhost (mspoc)

queues -> type '*quorum*'

=> q1 (queue de consommation des messages)
=> q2 (queue pour pusher des messages)

arguments :
- x-message-ttl = 300.000 milli-secondes -> 5 minutes
- x-delivery-limit = 5

### Auteur

Ce projet a été créé par Fabrice MAUPIN.

### License

GNU General Public License v3.0

See [LICENSE](  https://github.com/fmaupin/ms_poc_1_rabbitMQ/blob/master/LICENSE  ) to see the full text.



