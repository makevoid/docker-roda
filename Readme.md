# Docker-roda

Sample docker-enabled ruby (Roda) app as base for a JSON API.


Sample commands:

Build:

    docker build -t droda .

Run:

    docker run droda  -p 3000:3000

Rebuild and run:

    docker build -t droda . && docker run -p 3000:3000 droda 

Bash:

    docker run  -ti droda bash
