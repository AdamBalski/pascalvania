# Docker dev environment that replicates AGH university's `pascal` server environment
## Motivation
The server environment is not easy to develop on, it is not necessarily easy to view the effects and connect to the http port either (relatively). This aims to solve the problem, by reducing the need to connect to `pascal` at all, except for deployments. The workflow can be as followed:

0. Build (once)
1. On a development session's start, run the image
2. Make changes and see them live at `localhost:80` (hot reloading)
3. Deploy on dev session end (if needed of course)
## How-tos
### Build
```bash
docker build --build-arg USERNAME=user -t pascal-dev .
```
### Run dev environment locally and make it listen on `localhost:80`
```bash
docker run --rm -it -p 80:80 -v $(pwd)/home:/home/user pascal-dev
```
### Deploy directly to the uni remote server (assumes you have ssh keys installed)
```bash
REMOTE_USER=name REMOTE_HOST=pascal.somewhere.pl ./deploy.sh
```
## Environment description
Server is a `debian` with `apache2` installed with plugins: `cgi`, `userdir`, `rewrite`, `php8.2`, and `wsgi`. Check `Dockerfile` for details.
