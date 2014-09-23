#!/bin/bash

rm -rf target_cronus

DIR=$(cd "$(dirname "$0")"; pwd)
appname="node_hw"
version="0.1.`date +%Y%m%d%H%M`"
pkgsrc=`ls $DIR`

curl -sSL 'http://www.stackscaling.com/downloads/package_cronus' | DIR=$DIR appname=$appname version=$version pkgsrc=$pkgsrc bash

mkdir target_cronus
mv *.cronus *.cronus.prop target_cronus/

