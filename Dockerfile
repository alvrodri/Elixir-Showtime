FROM ubuntu:22.04

# Install common packages
RUN apt-get update
RUN apt-get install curl software-properties-common build-essential wget 7zip -y

# Download zig and update path
RUN wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz
RUN tar xf zig-linux-x86_64-0.13.0.tar.xz
ENV PATH="$PATH:/zig-linux-x86_64-0.13.0"

# Install Elixir
RUN add-apt-repository ppa:rabbitmq/rabbitmq-erlang
RUN apt update
RUN apt install elixir erlang-dev erlang-xmerl

# Prepare Burrito env
ENV MIX_ENV="prod"

# Prepare binaries
WORKDIR /app
RUN mix release