FROM ubuntu:latest

RUN apt-get update && \
    apt-get -q -y install autoconf automake libtool curl make g++ unzip curl pkg-config

RUN curl -L https://github.com/protocolbuffers/protobuf/releases/download/v3.10.0/protobuf-cpp-3.10.0.zip > protobuf-latest.zip

RUN unzip protobuf-latest.zip

WORKDIR protobuf-3.10.0

RUN ./configure && make && make check && make install && ldconfig

WORKDIR ..

RUN curl -L https://github.com/protobuf-c/protobuf-c/releases/download/v1.3.2/protobuf-c-1.3.2.tar.gz > protobuf-c-latest.tar.gz

RUN tar -xzvf protobuf-c-latest.tar.gz

WORKDIR protobuf-c-1.3.2

RUN ./configure && make && make install

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
