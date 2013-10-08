DeVM
====

DeVM is a means to easily set up development VMs in Docker containers. The
application itself is hosted inside of a container, so essentially you're
hosting docker containers inside of a docker container.

To build:

    docker build -t devm .

To run (after tweaking the `DATADIR` directory in this script):

    ./docker-run.sh

You can then login with password "root":

    ssh root@localhost -p2222

You can change the root password by running:

    ssh root@localhost -p2222 set-root-passwd

To create a new dev environment:

    ssh root@localhost -p2222 create-env <USER> <BASEIMAGE> <SSH KEY>

Notes:

* BASEIMAGE can by any Docker image identifier
* SSH KEY should be entire contents of ~/.ssh/id_rsa.pub"

Example (to create a project named 'myproject' based on the 'zefhemel/base-dev' image):

    ssh root@localhost -p2222 create-env myproject zefhemel/base-dev `cat ~/.ssh/id_rsa.pub`