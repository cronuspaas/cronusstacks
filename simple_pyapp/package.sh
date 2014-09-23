#!/bin/bash

rm -rf target_cronus

DIR=$(cd "$(dirname "$0")"; pwd)
appname="simple_pyserver"
version="1.0.0"
pkgsrc=`ls $DIR`

curl -sSL 'http://www.stackscaling.com/downloads/package_cronus' | DIR=$DIR appname=$appname version=$version pkgsrc=$pkgsrc platform=all bash

mkdir target_cronus
mv *.cronus *.cronus.prop target_cronus/

