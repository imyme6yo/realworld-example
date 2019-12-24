# @AUTHOR: imyme6yo "imyme6yo@gmail.com"
# @CREATE: 20191223 

# Arguments
ARG VERSION=1.9.4
ARG TAG=${VERSION}-alpine

FROM elixir:${TAG}

# Labels
# Maintainer
LABEL maintainer="imyme6yo"
LABEL email="imyme6yo@gmail.com"

# Install hex
RUN mix local.hex --force

# Install phoenix
RUN mix archive.install hex phx_new 1.4.11 --force

# copy code
RUN mkdir /code
WORKDIR /code
ADD . .
# WORKDIR /code/real_world --force
# RUN mix deps.get --force

CMD ["mix", "phx.server"]