FROM openjdk:8-jre
LABEL maintainer="jaroslav.barton@comsource.cz"

RUN adduser --system --disabled-password --disabled-login --shell=/bin/bash kafka

ENV SCALA_VERSION 2.12
ENV KAFKA_VERSION 0.11.0.0
ENV FULL_VERSION ${SCALA_VERSION}-${KAFKA_VERSION}

USER kafka
WORKDIR /home/kafka
RUN curl -L -O "http://mirror.hosting90.cz/apache/kafka/${KAFKA_VERSION}/kafka_${FULL_VERSION}.tgz" && \
    tar xvf kafka_${FULL_VERSION}.tgz && \
    rm kafka_${FULL_VERSION}.tgz && \
    ln -s kafka_${FULL_VERSION} kafka

CMD /home/kafka/kafka/bin/kafka-server-start.sh /etc/kafka/server.properties
