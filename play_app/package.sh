#!/bin/bash
# DIR: root package directory, default current working dir
# appname: name of the app
# version: version of the app
# pkgsrc: what to include in the package, default all non hidden files and dirs
# platform: platform (arch) x86 or x64
# 
# Package $appname-$version.$platform.cronus is in folder target_cronus

usage() {
    echo "cronus package application, and upload to cronusmaster"
    echo "  package: ./package.sh"
    echo "  package and upload: ./package.sh upload (export cronusmaster=host)"
    exit 0;
}

checkplat() {

    ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')

    case $(uname -m) in
    x86_64)
        ARCH=x64  # or AMD64 or Intel64 or whatever
        ;;
    i*86)
        ARCH=x86  # or IA32 or Intel32 or whatever
        ;;
    *)
        # leave ARCH as-is
        ;;
    esac

    echo "${ARCH}"

}

if [[ $1 == "-h" ]]; then
    usage
fi

rm -rf target_cronus

DIR=$(cd "$(dirname "$0")"; pwd) # default current dir
appname="playapp" # name of the app
version="0.1.`date +%Y%m%d%H%M%S`" # package version
pkgsrc=`ls $DIR` # include everything in package
platform="all" # platform is x64 or x86
pkgname="$appname-$version.$platform.cronus"

wget -qO- 'http://cronuspaas.github.io/downloads/package_cronus' | DIR=$DIR appname=$appname version=$version pkgsrc=$pkgsrc platform=$platform bash

mkdir target_cronus
mv $pkgname $pkgname.prop target_cronus/

if [[ $1 == "upload" ]]; then
    if [[ ! -z $cronusmaster ]]; then
        echo "upload cronus package to cronusmaster at $cronusmaster"
        curl -F "data=@target_cronus/$pkgname" http://$cronusmaster:9000/agent/uploadPkg
    else
        echo "export cronusmaster=host to upload package"
    fi
fi
