docker-3asl
=======================


Docker image used for running [Why3](http://why3.lri.fr) and [Soufflé](https://souffle-lang.github.io/) in the "Software Science" 3rd year at [CentraleSupélec](http://www.centralesupelec.fr).

Available on [Docker hub](https://hub.docker.com/r/fredblgr/3asl)

The source files are available on [GitHub](https://github.com/Frederic-Boulanger-UPS/docker-3asl).

There is also a Vagrant VM with the same software installed.

The ```docker-dist```and ```vagrant-dist``` folders contain files to help the deployment of the docker image and the Vagrant VM.

GUI
-----
For programs with a GUI (such as ```why3 ide```), you will need an X11 server running. You should allow connections from the localhost (```xhost +localhost```). The ```--env``` option sets the display correctly inside the container. Tested with success with [XQuartz](https://www.xquartz.org/) on MacOS, and with [VcXsrv](https://sourceforge.net/projects/vcxsrv/) on Windows.

Shared directory
----------------

To have persistent data, you should store your documents in ```/workspace``` (Docker) or ```/home/vagrant/workspace```(Vagrant), which is where the current directory is mounted.

License
==================

Apache License Version 2.0, January 2004 http://www.apache.org/licenses/LICENSE-2.0

By [Frédéric Boulanger](https://github.com/Frederic-Boulanger-UPS)
