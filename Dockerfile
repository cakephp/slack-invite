FROM node:6.11.1-slim

ENV PORT 3000

RUN apt-get update \
  && apt-get install -y git;

ADD . /srv/www
WORKDIR /srv/www

RUN cd /srv/www \
  && git clone https://github.com/rauchg/slackin \
  && cd slackin \
  && git checkout f52054363ea885bdeeb6b2c03f9a602251a41731 \
  && npm install \
  && npm run build;

CMD /srv/www/run.sh

EXPOSE 3000
