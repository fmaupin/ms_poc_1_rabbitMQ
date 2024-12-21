FROM rabbitmq:4.0.5-management

COPY rabbitmq.config /etc/rabbitmq/

COPY definitions.json /etc/rabbitmq/

RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config  /etc/rabbitmq/definitions.json

CMD ["rabbitmq-server"]
