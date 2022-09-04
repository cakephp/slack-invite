FROM node:6.11.1-slim

ENV PORT 9898

RUN apt-get update \
  && apt-get install -y git;

ADD . /srv/www
WORKDIR /srv/www

RUN cd /srv/www \
  && git clone https://github.com/rauchg/slackin \
  && cd slackin \
  # We're using an old version as I didn't have time to setup recaptcha
  && git checkout 0.13.1 \
  && npm install \
  && npm run build;

CMD /srv/www/run.sh

EXPOSE 9898
