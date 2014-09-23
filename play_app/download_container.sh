#!/bin/bash
# this download and unpack play 1.x container
# change the play download link for custom version of the container 

TMPFILE="tempfile"
wget -O $TMPFILE "http://downloads.typesafe.com/play/1.2.5.3/play-1.2.5.3.zip"
unzip $TMPFILE
mv play* container_runtime
rm $TMPFILE
