# A simple, production ready Rocket.Chat docker-compose environment
Runs on MongoDB v4 and Node.js v12.

Build and run your own Rocket.Chat system with docker-compose. In production deployments run this with a reverse proxy (Nginx or other) with Certbot. For larger deployments you may want to also add MongoDB replication.

You can build the desired version of Rocket.Chat by changing the build config argument `RC_VERSION`.

### Deploy new Rocket.Chat releases
`$ docker-compose build && docker-compose down && docker-compose up`

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
