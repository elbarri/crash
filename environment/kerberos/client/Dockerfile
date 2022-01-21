ARG TAG
FROM vdesabou/kafka-docker-playground-connect:${TAG}

# 4. Copy in required settings for client access to Kafka
COPY consumer.properties /etc/kafka/consumer.properties
COPY producer.properties /etc/kafka/producer.properties
COPY command.properties /etc/kafka/command.properties
COPY client.sasl.jaas.config /etc/kafka/client_jaas.conf

USER root
SHELL ["/bin/bash", "-c"]

RUN yum install -y gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel cyrus-sasl-devel.x86_64 autoconf java-1.8.0-openjdk-devel git && yum clean all

RUN dnf install -y glibc-langpack-en

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV KRB5_CONFIG /etc/krb5.conf

WORKDIR /opt/

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
RUN echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
RUN echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

COPY init_asdf.sh /tmp/init_asdf.sh
RUN /tmp/init_asdf.sh

ENV PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

COPY myapp /opt/myapp
ENV ERL_AFLAGS "-kernel shell_history enabled"
#RUN ./rebar3/bootstrap

CMD sleep infinity
