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
RUN mkdir ~/.asdf/shims
RUN echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
RUN echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
RUN $HOME/.asdf/bin/asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN $HOME/.asdf/bin/asdf install erlang 24.2
RUN $HOME/.asdf/bin/asdf global erlang 24.2

#RUN curl -O https://s3.amazonaws.com/rebar3/rebar3 && \\
#    chmod +x rebar3 && \\
#    mv rebar3 /usr/bin

RUN $HOME/.asdf/bin/asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
RUN $HOME/.asdf/bin/asdf install elixir 1.11.4
RUN $HOME/.asdf/bin/asdf global elixir 1.11.4

RUN source $HOME/.asdf/asdf.sh
RUN $HOME/.asdf/bin/asdf install elixir 1.11.3

ENV PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
RUN asdf install elixir 1.9.0
#RUN mix local.hex --force
#RUN mix local.rebar --force

CMD sleep infinity
