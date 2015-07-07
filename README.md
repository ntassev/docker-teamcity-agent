# Using the TeamCity Agent container

Create the container:

    TEAMCITY_SERVER=http://your_teamcity_server ./create.sh
    
Put the init-script in place:

    sudo cp init-scripts/upstart/teamcity-agent.conf /etc/init/
or
    sudo cp init-scripts/systemd/teamcity-agent.service /lib/systemd/system/
    
Start the container:

    sudo service teamcity-agent start
