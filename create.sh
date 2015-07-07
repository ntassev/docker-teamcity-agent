#!/bin/bash

REPO="ntassev/teamcity-agent"
TAG="latest"

NAME="teamcity-agent"
TEAMCITY_SERVER=${TEAMCITY_SERVER:-http://teamcity:8111}
TEAMCITY_AGENT_NAME=${TEAMCITY_AGENT_NAME:-$USER}
TEAMCITY_AGENT_OWN_IP=${TEAMCITY_AGENT_OWN_IP:-$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')}

sudo docker create \
 --privileged \
 --name $NAME \
 -e TEAMCITY_SERVER=$TEAMCITY_SERVER \
 -e TEAMCITY_AGENT_NAME=$TEAMCITY_AGENT_NAME \
 -e TEAMCITY_AGENT_OWN_IP=$TEAMCITY_AGENT_OWN_IP \
 -p 9090:9090 \
 $REPO:$TAG
