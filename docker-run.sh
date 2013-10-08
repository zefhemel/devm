#!/bin/bash

DATADIR=/home/zef/data

docker run -d -p 2222:22 -privileged -lxc-conf="lxc.aa_profile=unconfined" -v $DATADIR:/data zefhemel/devm