# docker-xca

Run [XCA][xca] the X Certificate and Key management in a docker image.

[xca]: http://xca.sourceforge.net/

## How it works

The image need access to the X11 socket in `/tmp/.X11-unix`. To permit access to the running display (:0), the XCA application runs with a default user which has uid=1000 and gid=1000, what is basically the first added user on a GNU/Linux distribution. You can modify this by clone this repo and set the `XDA_UID` and `XDA_GID` in the `Dockerfile` and re-build the image.

You can change the defualt `DISPLAY` port `:0` with the environment variable.

### Sample

```
$ docker run \
    --rm \
    --privileged \
    -e "DISPLAY=:0"
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/self/xca_store.xdb:/home/xca/xca_store.xdb \
    rroemhild/xca
```

## Run script

There is also a run-script to start the image as a normal local app. Download the `xca` run-script, make it executeable and run it.

```
./xca xca_store.xdb
```

## Issues

The image has no permissions to write to the XDA file.
