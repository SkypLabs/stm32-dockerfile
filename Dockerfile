FROM docker.io/ubuntu:trusty
MAINTAINER skyper@skyplabs.net

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y binutils-arm-none-eabi gcc-arm-none-eabi \
    && apt-get install -y git make cmake autoconf libusb-1.0.0-dev

RUN useradd -m dev
USER dev
WORKDIR /home/dev

RUN git clone https://github.com/texane/stlink.git \
    && mkdir stlink/build
WORKDIR /home/dev/stlink/build
RUN cmake -DCMAKE_BUILD_TYPE=Debug .. \
    && make \
    && ln -s /home/dev/stlink/build/st-flash /usr/bin/st-flash \
    && ln -s /home/dev/stlink/build/st-info /usr/bin/st-info \
    && ln -s /home/dev/stlink/build/src/gdbserver/st-util /usr/bin/st-util \
    && cp /home/dev/stlink/etc/udev/rules.d/*.rules /etc/udev/rules.d/ \
    && mkdir /home/dev/app

WORKDIR /home/dev/app
CMD ["make"]
