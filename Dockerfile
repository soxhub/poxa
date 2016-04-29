FROM trenpixster/elixir:1.0.1

COPY . /src
WORKDIR /src/
RUN MIX_ENV=prod mix local.hex --force
RUN MIX_ENV=prod mix local.rebar --force
RUN MIX_ENV=prod mix do deps.get, compile, release && mv rel/poxa /app && mv setup_env.sh /app/
WORKDIR /app/

CMD ["bash", "-c", "./setup_env.sh && ./bin/poxa foreground"]