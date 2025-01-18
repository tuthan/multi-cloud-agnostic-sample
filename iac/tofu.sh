#!/bin/bash

# Default values
VARIABLE_FILE=""
TARGETS=()
APPLY=false

# Help message
function usage() {
    echo "Usage: $0 [-v variable_file] [-t target] [-a]"
    echo "  -v  Path to the variable file (e.g., tofu.tfvars)"
    echo "  -t  Target resource to plan/apply (can be used multiple times)"
    echo "  -a  Apply the changes after planning (defaults to false)"
    exit 1
}

# Parse arguments
while getopts "v:t:a" opt; do
    case ${opt} in
        v)
            VARIABLE_FILE="$OPTARG"
            ;;
        t)
            TARGETS+=("$OPTARG")
            ;;
        a)
            APPLY=true
            ;;
        *)
            usage
            ;;
    esac
done

# Validate that tofu is installed
if ! command -v tofu &>/dev/null; then
    echo "Error: tofu is not installed. Please install it first."
    exit 1
fi

# Initialize tofu
echo "Initializing tofu..."
INIT_CMD="tofu init -backend-config=be_conf/local.conf -upgrade"
eval "$INIT_CMD"

if [ $? -ne 0 ]; then
    echo "Error: tofu init failed."
    exit 1
fi

# Build tofu plan command
PLAN_CMD="tofu plan"
if [[ -n "$VARIABLE_FILE" ]]; then
    PLAN_CMD+=" -var-file=$VARIABLE_FILE"
fi

for TARGET in "${TARGETS[@]}"; do
    PLAN_CMD+=" -target=$TARGET"
done

# Execute tofu plan
echo "Running: $PLAN_CMD"
eval "$PLAN_CMD"

if [ $? -ne 0 ]; then
    echo "Error: tofu plan failed."
    exit 1
fi

# If apply flag is set, proceed with tofu apply
if $APPLY; then
    APPLY_CMD="tofu apply"
    if [[ -n "$VARIABLE_FILE" ]]; then
        APPLY_CMD+=" -var-file=$VARIABLE_FILE"
    fi

    for TARGET in "${TARGETS[@]}"; do
        APPLY_CMD+=" -target=$TARGET"
    done

    # Execute tofu apply
    echo "Running: $APPLY_CMD"
    eval "$APPLY_CMD"

    if [ $? -ne 0 ]; then
        echo "Error: tofu apply failed."
        exit 1
    fi
fi

echo "tofu commands completed successfully."
