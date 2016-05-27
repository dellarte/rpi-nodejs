FROM resin/rpi-raspbian
MAINTAINER Gavin Adam <gavinadam80@gmail.com>

RUN apt-get update && apt-get install -y \
    ca-certificates \
    wget \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV NODEJS_OS linux
ENV NODEJS_VER v6.2.0
ENV NODEJS_ARCH armv7l

RUN wget https://nodejs.org/dist/$NODEJS_VER/node-$NODEJS_VER-$NODEJS_OS-$NODEJS_ARCH.tar.xz && \
tar xf node-$NODEJS_VER-$NODEJS_OS-$NODEJS_ARCH.tar.xz && \
rm node-$NODEJS_VER-$NODEJS_OS-$NODEJS_ARCH.tar.xz && \
mkdir /data

WORKDIR /data

ENV PATH /node-$NODEJS_VER-$NODEJS_OS-$NODEJS_ARCH/bin:$PATH

RUN npm install --global nodemon && \
npm install --global express && \
npm install --global ejs && \
npm install --global compression && \
npm install --global fs && \
npm install --global morgan && \
npm install --global file-stream-rotator && \
npm install --global socket.io

ENV NODE_PATH=/node-$NODEJS_VER-$NODEJS_OS-$NODEJS_ARCH/lib/node_modules

EXPOSE 80
CMD [ "node" ]
