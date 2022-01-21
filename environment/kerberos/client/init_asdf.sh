#!/usr/bin/env bash
source "$HOME/.asdf/asdf.sh"

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

asdf install erlang 24.2
asdf install elixir 1.11.4

asdf global erlang 24.2
asdf global elixir 1.11.4

asdf reshim
