FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y python-software-properties python g++ make
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get -y update 
RUN apt-get -y install nodejs
RUN npm install node-etcd@2.1.1 -g
RUN mkdir /work
ADD package.json /work/
RUN cd work && npm install
ADD . /work
ENV NODE_ENV production
ENV NG_HTTPS true 
EXPOSE 80 443
WORKDIR /work
CMD ["/usr/bin/node", "/work/bin/hipache", "-c", "/work/config/config.json"]
