#!/bin/bash
if [ -z "$TEAMCITY_AGENT_NAME" ]; then
    echo "TEAMCITY_AGENT_NAME variable not set, launch with -e TEAMCITY_AGENT_NAME=some-name"
    exit 1
fi

if [ -z "$TEAMCITY_AGENT_OWN_IP" ]; then
    echo "TEAMCITY_AGENT_OWN_IP variable not set, launch with -e TEAMCITY_AGENT_OWN_IP=external_ip_accessible_to_the_teamcity_server"
    exit 1
fi


echo "name=${TEAMCITY_AGENT_NAME}" >> $AGENT_DIR/conf/buildAgent.properties
echo "ownAddress=${TEAMCITY_AGENT_OWN_IP}" >> $AGENT_DIR/conf/buildAgent.properties
