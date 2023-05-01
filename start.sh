# Set the working directory
cd /steamcmd/rust

# Run the server
echo "Starting Rust.."

# Preparing arguments
function add_argument_pair {
        local -n arr=$1
        if  [ ! -z "${!3}" ]; then
                  arr+=("${2}");
                  arr+=("${!3}");
        fi
}

ARGUMENTS=()

add_argument_pair ARGUMENTS "+server.port" "RUST_SERVER_PORT"
add_argument_pair ARGUMENTS "+server.queryport" "RUST_SERVER_QUERYPORT"
add_argument_pair ARGUMENTS "+server.identity" "RUST_SERVER_IDENTITY"

add_argument_pair ARGUMENTS "+server.worldsize" "RUST_SERVER_WORLDSIZE"
add_argument_pair ARGUMENTS "+server.seed" "RUST_SERVER_SEED"

add_argument_pair ARGUMENTS "+server.hostname" "RUST_SERVER_NAME"
add_argument_pair ARGUMENTS "+server.url" "RUST_SERVER_URL"
add_argument_pair ARGUMENTS "+server.headerimage" "RUST_SERVER_BANNER_URL"
add_argument_pair ARGUMENTS "+server.description" "RUST_SERVER_DESCRIPTION"
add_argument_pair ARGUMENTS "+server.maxplayers" "RUST_SERVER_MAXPLAYERS"
add_argument_pair ARGUMENTS "+server.saveinterval" "RUST_SERVER_SAVE_INTERVAL"
add_argument_pair ARGUMENTS "+app.port" "RUST_APP_PORT"


/steamcmd/rust/RustDedicated -batchmode -load -nographics +server.secure 1 \
  -server.ip 0.0.0.0 \
  -server.port 28015 \
  -rcon.ip 0.0.0.0 \
  -rcon.port 28016 \
  -rcon.password "12341234" \
  -server.maxplayers 100 \
  -server.hostname "[MIDWEST] Vanilla SOLO ONLY" \
  -server.identity "$(whoami)" \
  -server.level "Procedural Map" \
  -server.seed 42069 \
  -server.worldsize 3500 \
  -server.saveinterval 300 \
  -server.globalchat true \
  -server.description "SOLO ONLY!!" \
  -server.headerimage "https://placehold.it/512x256" \
  -server.url "https://pornhub.com" \
  -server.logfile "rust-$(date -I).log"
