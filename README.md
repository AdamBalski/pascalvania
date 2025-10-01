# Docker dev environment that replicates AGH university's `pascal` server environment
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
