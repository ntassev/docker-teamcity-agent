#!/bin/bash

REPO="ntassev/teamcity-agent"
TAG="latest"

NAME="teamcity-agent"
TEAMCITY_SERVER=${TEAMCITY_SERVER:-http://teamcity:8111}
TEAMCITY_AGENT_NAME=${TEAMCITY_AGENT_NAME:-$USER}

sudo docker create \
 --privileged \
 --name $NAME \
 -e TEAMCITY_SERVER=$TEAMCITY_SERVER \
 -e TEAMCITY_AGENT_NAME=$TEAMCITY_AGENT_NAME \
 $REPO:$TAG
