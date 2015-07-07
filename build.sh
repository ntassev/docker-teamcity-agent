#!/bin/sh

REPO="ntassev/teamcity-agent"
TAG=latest

sudo docker build -t $REPO:$TAG $(dirname $0) || exit $?
echo $REPO:$TAG image is ready.
