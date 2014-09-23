#!/bin/bash
# DIR: root package directory, default current working dir
# appname: name of the app
# version: version of the app
# pkgsrc: what to include in the package, default all non hidden files and dirs
# platform: optional platform, script will generate default value if not provided.
# 
# Package $appname-$version.$platform.cronus is in folder target_cronus

rm -rf target_cronus

DIR=$(cd "$(dirname "$0")"; pwd) # default current dir
appname="pyserver" # name of the app
version="1.0.0" # package version
pkgsrc=`ls $DIR` # include everything in package
platform="all"

wget -qO- 'http://www.stackscaling.com/downloads/package_cronus' | DIR=$DIR appname=$appname version=$version pkgsrc=$pkgsrc platform=$platform bash

mkdir target_cronus
mv *.cronus *.cronus.prop target_cronus/

