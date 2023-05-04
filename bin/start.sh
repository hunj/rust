# Set the working directory
cd steamcmd/rust

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
  -logfile "log-$(date -I).log"
