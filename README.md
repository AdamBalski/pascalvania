# Docker dev environment that replicates AGH university's `pascal` server environment
### Build
```bash
docker build --build-arg USERNAME=user -t pascal-dev .
```
### Run dev environment locally and make it listen on `localhost:80`
```bash
docker run --rm -it -p 80:80 -v $(pwd)/home:/home/user pascal-dev
```
### Deploy directly to the uni remote server
```txt
TODO: deploy.sh that scp's contents from ./home to public_html on remote
TODO: Github Action
```
