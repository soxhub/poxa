FROM elixir:1.2.4

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y git

COPY . /src
WORKDIR /src/
RUN MIX_ENV=prod mix local.hex --force
RUN MIX_ENV=prod mix local.rebar --force
RUN MIX_ENV=prod mix do deps.get, compile, release && mv rel/poxa /app && mv setup_env.sh /app/
WORKDIR /app/

CMD ["bash", "-c", "./setup_env.sh && ./bin/poxa foreground"]