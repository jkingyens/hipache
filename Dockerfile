FROM node:0.10.38 
RUN npm install node-etcd@4.0.2 -g
RUN mkdir /work
ADD package.json /work/
RUN cd work && npm install
ADD . /work
ENV NODE_ENV production
ENV NG_HTTPS true 
EXPOSE 80 443
WORKDIR /work
CMD ["node", "/work/bin/hipache", "-c", "/work/config/config.json"]
