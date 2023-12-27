# spigot-docker-compose
Run Spigot server using Docker Compose.

## Instruction
1. Pull this repository.
2. Edit `docker-compose.yml` to fit your use case.
3. Run `docker compose build` to build Spigot server.
4. Run `docker compose up` once, and check contents of `./server` directory. This directory contains all of Spigot server files.
5. Run `docker compose up -d` to start running server.

## Note
- Uses OpenJDK 17. To change, edit `apt-get install ... openjdk-17-jdk` in `Dockerfile`.
- To change Spigot server version, add `args: version: ...` to `docker-compose.yml`.
- Current memory limit is set to 8G. To change, edit `Dockerfile`'s `CMD [..., "-Xmx8G" ,...]`.
