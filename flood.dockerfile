FROM node:alpine
MAINTAINER Yohann Leon <yohann@leon.re>

RUN apk add --update mediainfo git python make build-base

RUN mkdir -p /usr/flood
WORKDIR /usr/flood

RUN git clone https://github.com/jesec/flood . && cp config.docker.js config.js

RUN npm install && npm cache verify
RUN npm run build

# flood server is on 3000
EXPOSE 3647

CMD [ "npm", "start", "--", "--port", "3647" ]
