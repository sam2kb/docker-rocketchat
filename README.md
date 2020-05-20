# A simple, production ready Rocket.Chat docker-compose setup
Runs on MongoDB v4 and Node.js v12.

Build and run your own Rocket.Chat system with docker-compose. In production deployments run this with a reverse proxy (Nginx or other) with Certbot. For larger deployments you may want to also add MongoDB replication.

You can build the desired version of Rocket.Chat by changing the build config argument `RC_VERSION`.

### Deploy new versions
`$ docker-compose build && docker-compose down && docker-compose up`
