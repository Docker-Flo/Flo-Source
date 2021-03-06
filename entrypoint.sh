#!/bin/bash
sleep 1
echo "Flo Version 1.0 Source"
cd /home/container

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}

if [ $? -ne 0 ]; then
    echo "FONIX_CONTAINER_ERR: There was an error while attempting to run the start command."
    exit 1
fi
