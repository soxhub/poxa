FROM trenpixster/elixir:1.0.1

COPY . /src

ENV MIX_ENV prod
ENV PORT 3008
EXPOSE $PORT
EXPOSE 8080

WORKDIR /src/
RUN mix local.hex --force
RUN mix local.rebar --force
#RUN mix do deps.get, compile, compile.protocols
RUN MIX_ENV=prod mix do deps.get, compile, release

#CMD ["mix", "run", "--no-halt"]
CMD ["./rel/poxa/bin/poxa", "foreground"]