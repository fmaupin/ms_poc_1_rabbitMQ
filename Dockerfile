FROM rabbitmq:3.12.2-management

MAINTAINER fmaupin

ADD rabbitmq.config /etc/rabbitmq/

ADD definitions.json /etc/rabbitmq/

RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config  /etc/rabbitmq/definitions.json

CMD ["rabbitmq-server"]

