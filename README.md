# Docker dev environment that replicates AGH university's `pascal` server environment
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
