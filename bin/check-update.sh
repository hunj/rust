#!/bin/sh

echo "Checking updates..."
BUILD_ID=$(cat /steamcmd/rust/build.id)
NEW_BUILD_ID=$(steamcmd +login anonymous +app_info_update 1 +app_info_print "258550" +quit | grep -EA 1000 "^\s+\"branches\"$" | grep -EA 5 "^\s+\"public\"$" | grep -m 1 -EB 10 "^\s+}$" | grep -E "^\s+\"buildid\"\s+" | tr '[:blank:]"' ' ' | tr -s ' ' | sed "s/ buildid //g" | xargs)

if [ $BUILD_ID -ne $NEW_BUILD_ID ]
then
    echo "Updating Rust..."
    steamcmd +login anonymous +force_install_dir /steamcmd/rust +app_update 258550 +quit
    echo "Update Complete!"
else
    echo "No need update!"
fi
