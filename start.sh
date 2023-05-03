# Set the working directory
cd steamcmd/rust

# Run the server
echo "Starting Rust.."

./RustDedicated -batchmode +server.secure 1 \
  +server.ip 0.0.0.0 \
  +server.port 28015 \
  +rcon.ip 0.0.0.0 \
  +rcon.port 28016 \
  +rcon.web 1 \
  +rcon.password "12341234" \
  +server.maxplayers 100 \
  +server.hostname "[MIDWEST] Vanilla SOLO ONLY" \
  +server.identity "$(whoami)" \
  +server.level "Procedural Map" \
  +server.seed 42069 \
  +server.worldsize 3500 \
  +server.saveinterval 300 \
  +server.globalchat true \
  +server.description "SOLO ONLY!!" \
  +server.headerimage "https://placehold.it/512x256" \
  +server.url "https://pornhub.com" \
#  -logfile "rust-$(date -I).log"

