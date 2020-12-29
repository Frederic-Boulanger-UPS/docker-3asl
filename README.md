# docker-3asldocker-3asl
=======================


Docker image used for running [Why3](http://why3.lri.fr) and [Soufflé](https://souffle-lang.github.io/) in the "Software Science" 3rd year at [CentraleSupélec](http://www.centralesupelec.fr).

Available on [Docker hub](https://hub.docker.com/r/fredblgr/3asl)

The source files are available on [GitHub](https://github.com/Frederic-Boulanger-UPS/docker-3asl).

Typical usage is:

```
docker run --rm -it -v "$(PWD):/workspace:rw" --name 3asl2020 --env="DISPLAY=host.docker.internal:0" fredblgr/3asl:2020
```

GUI
-----
For programs with a GUI (such as ```why3 ide```), you will need an X11 server running. You should allow connections from the localhost (```xhost +localhost```). The ```--env``` option sets the display correctly inside the container. Tested with success with [XQuartz](https://www.xquartz.org/) on MacOS, and with [VcXsrv](https://sourceforge.net/projects/vcxsrv/) on Windows.

Shared directory
----------------

To avoid modifying the image, you should store your documents in ```/workspace```, which is where the current directory is mounted thanks to the ```-v```option. The ```--rm```option removes the container when you exit the shell.

License
==================

Apache License Version 2.0, January 2004 http://www.apache.org/licenses/LICENSE-2.0

By [Frédéric Boulanger](https://github.com/Frederic-Boulanger-UPS)
