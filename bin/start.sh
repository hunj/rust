echo "*** RUST SERVER ***"

BUILD_ID=$(cat /steamcmd/rust/build.id)
if [ ! -z "$BUILD_ID" ]
then
    echo "Installing Rust..."
else
    # Check for update
    echo "Checking updates..."
    NEW_BUILD_ID=$(steamcmd +login anonymous +app_info_update 1 +app_info_print "258550" +quit | grep -EA 1000 "^\s+\"branches\"$" | grep -EA 5 "^\s+\"public\"$" | grep -m 1 -EB 10 "^\s+}$" | grep -E "^\s+\"buildid\"\s+" | tr '[:blank:]"' ' ' | tr -s ' ' | sed "s/ buildid //g" | xargs)

    if [ ! "$BUILD_ID" = "$NEW_BUILD_ID" ]
    then
        echo "Updating Rust..."
        steamcmd +force_install_dir /steamcmd/rust +login anonymous +app_update 258550 +quit
        echo "Update Complete!"
    else
        echo "No need to update."
    fi
fi

# Set the working directory
cd /steamcmd/rust

# Run the server
echo "Starting Rust.."

./RustDedicated -batchmode +server.secure 1 \
  +server.ip $RUST_SERVER_IP \
  +server.port $RUST_SERVER_PORT \
  +rcon.web $RUST_RCON_WEB \
  +rcon.ip $RUST_RCON_IP \
  +rcon.port $RUST_RCON_PORT \
  +rcon.password $RUST_RCON_PASSWORD \
  +server.maxplayers $RUST_SERVER_MAXPLAYERS \
  +server.hostname "$RUST_SERVER_HOSTNAME" \
  +server.identity $(whoami) \
  +server.level "$RUST_SERVER_LEVEL" \
  +server.seed $RUST_SERVER_SEED \
  +server.worldsize $RUST_SERVER_WORLDSIZE \
  +server.saveinterval $RUST_SERVER_SAVEINTERVAL \
  +server.description "$RUST_SERVER_DESCRIPTION" \
  +server.headerimage "$RUST_SERVER_HEADERIMAGE" \
  +server.url "$RUST_SERVER_URL"
