FROM node:12-slim AS build
ARG RC_VERSION=3.2.2
WORKDIR /app

# Install gpg and import the key 4FD08104
RUN apt-get update \
  && apt-get install -y gnupg curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir ~/.gnupg || echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
  && gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys 0E163286C20D07B9787EBE9FD7F9D0414FD08104

RUN curl -fSL "https://releases.rocket.chat/${RC_VERSION}/download" -o rocket.chat.tgz \
  && curl -fSL "https://releases.rocket.chat/${RC_VERSION}/asc" -o rocket.chat.tgz.asc \
  && gpg --batch --verify rocket.chat.tgz.asc rocket.chat.tgz \
  && tar zxvf rocket.chat.tgz \
  && rm rocket.chat.tgz rocket.chat.tgz.asc \
  && cd bundle/programs/server \
  && npm install --silent \
  && npm cache clear --force

FROM node:12-slim AS run
VOLUME /app/uploads
WORKDIR /app

RUN groupadd -r app \
  && useradd -r -g app app \
  && mkdir -p /app/uploads

USER app
COPY --chown=app:app --from=build /app/bundle/. ./

ENV DEPLOY_METHOD=docker-official \
  MONGO_URL=mongodb://db:27017/meteor \
  HOME=/tmp \
  PORT=3000 \
  ROOT_URL=http://localhost:3000 \
  Accounts_AvatarStorePath=/app/uploads

EXPOSE 3000

CMD ["node", "main.js"]