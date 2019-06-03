FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  nginx \
  git \
  vim \
  wget \
  curl
RUN /bin/bash -c "$(wget -qO- https://apt.vapor.sh)"
RUN apt-get install -y \
  swift \
  vapor

RUN vapor new Hello --template=web
WORKDIR /Hello
RUN vapor build

EXPOSE 80

CMD ["swift", "run", "Run", "--hostname", "0.0.0.0", "--port", "80"]
