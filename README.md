# docker-rocketchat
A simple custom-build Rocket.Chat docker image

Build and run your own Rocket.Chat system with docker-compose. In production deployments run this with a reverse proxy (Nginx or other) with Certbot.

You can build the desired version of Rocket.Chat by changing the build config arg `RC_VERSION`.

### Deploy new versions
`$ docker-compose build && docker-compose down && docker-compose up`
