# Production-ready Rocket.Chat docker-compose environment

Creates a Docker multi-stage build of [Rocket.Chat](https://rocket.chat/). Runs on MongoDB v4 and Node.js v12.

Build and run your own Rocket.Chat system with docker-compose. In production setup you will need to run this with a reverse proxy (Nginx or other) and an SSL from Certbot. For larger deployments you may want to add MongoDB replication.

You can build the desired version of Rocket.Chat and upgrade by changing the build config argument `RC_VERSION`.

### Run with

Or create a `.env` file with `CHAT_HOSTNAME=localhost`.

```
$ export CHAT_HOSTNAME=localhost
$ docker-compose up -d
```

### Deploy new Rocket.Chat releases

```
$ export CHAT_HOSTNAME=localhost
$ docker-compose build && docker-compose down && docker-compose up
```

Rocket.Chat container log

```
➔ +------------------------------------------+
➔ |              SERVER RUNNING              |
➔ +------------------------------------------+
➔ |                                          |
➔ |  Rocket.Chat Version: 3.2.2              |
➔ |       NodeJS Version: 12.16.3 - x64      |
➔ |      MongoDB Version: 4.2.1              |
➔ |       MongoDB Engine: wiredTiger         |
➔ |             Platform: linux              |
➔ |         Process Port: 3000               |
➔ |             Site URL: https://localhost  |
➔ |     ReplicaSet OpLog: Enabled            |
➔ |          Commit Hash: a720d25f4e         |
➔ |        Commit Branch: HEAD               |
➔ |                                          |
➔ +------------------------------------------+
```