#!/bin/bash
tenant=$1
 
# Read values from config.toml
user=$(sed -n 's/^user = "\([^"]*\)"/\1/p' artifacts/config.toml)
password=$(sed -n 's/^password = "\([^"]*\)"/\1/p' artifacts/config.toml)
database=$(sed -n 's/^database = "\([^"]*\)"/\1/p' artifacts/config.toml)
host=$(sed -n 's/^host = "\([^"]*\)"/\1/p' artifacts/config.toml)
port=$(sed -n 's/^port = "\([^"]*\)"/\1/p' artifacts/config.toml)

# Export password to avoid psql prompt
export PGPASSWORD=$password

# Run psql command

if [ "$tenant" == "dev" ]; then
    psql -q -U "$user" -d "$database" -h "$host" -p "$port" -f artifacts/data-dump.sql
fi

# Unset the password variable for security
unset PGPASSWORD

cleanup() {
    echo "Stopping the processes..."

    # Kill the Java process
    if [ -n "$java_pid" ]; then
        kill "$java_pid" 2>/dev/null
    fi

    # Kill the Node.js process
    if [ -n "$node_pid" ]; then
        kill "$node_pid" 2>/dev/null
    fi

    # Wait for both processes to terminate
    wait "$java_pid" 2>/dev/null
    wait "$node_pid" 2>/dev/null

    echo "All processes have been stopped."
    exit 1
}

# Trap Ctrl+C (SIGINT) and call the cleanup function
trap cleanup SIGINT SIGTERM EXIT

cd artifacts

# Start the Java application
echo "Starting Backend service..."
java -jar devportal.jar &
java_pid=$!  # Capture the process ID of the Java process

# Start the Node.js application
echo "Starting Devportal application..."
npm run build-css --watch & node ../node_modules/devportal-webapp/src/single-tenant.js
node_pid=$!
