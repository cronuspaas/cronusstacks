#!/bin/bash
# this download and unpack node container
# change the node download link for custom version of the container 

wget -O - "http://nodejs.org/dist/v0.10.32/node-v0.10.32-linux-x64.tar.gz" | tar xzf -
mv node* container_runtime
