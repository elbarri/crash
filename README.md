Steps

* cd environment/kerberos
* ./start.sh
* docker exec -it client /bin/bash

Once inside the container run:
* mix local.rebar --force
* cd myapp
* /root/.asdf/installs/elixir/1.11.4/.mix/rebar3 compile
* erl -pa _build/default/lib/*/ebin
* application:ensure_all_started(brod).
* brod:start_client([{"broker", 9092}], client1, [{sasl, {callback, brod_gssapi, {gssapi, "/var/lib/secret/kafka-client.key", <<"kafka_producer@TEST.CONFLUENT.IO">>}}}]).
