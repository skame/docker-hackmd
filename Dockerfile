FROM node:5.9.1-slim
MAINTAINER KAMEI Satoshi <skame@nttv6.jp>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends git bzip2 python make g++ libkrb5-3 libkrb5-dev
RUN npm install -g pm2
RUN git clone https://github.com/shabutora/hackmd.git /opt/hackmd

WORKDIR /opt/hackmd

RUN npm install

EXPOSE 80
EXPOSE 443

CMD pm2 start processes.json && tail -f logs/hackmd_out.log

