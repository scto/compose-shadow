#!/bin/bash

FILE="$GITHUB_WORKSPACE/local.properties"

if [ -f "$FILE" ]; then
    echo "$FILE already exists"
    exit 0
fi

check_env_var() {
    if [ -z "${!1}" ]; then
        echo "Error: $1 environment variable is not set."
        exit 1
    fi
}

check_env_var "GITHUB_USERNAME"
check_env_var "GITHUB_PASSWORD"

echo "Creating $FILE..."
{
    echo "githubPackagesUsername=${{ secrets.GITHUB_USERNAME }}"
    echo "githubPackagesPassword=${{ secrets.GITHUB_PASSWORD }}"

#    echo "githubPackagesUsername=$GITHUB_USERNAME"
#    echo "githubPackagesPassword=$GITHUB_PASSWORD"
} >>"$FILE"

echo "$FILE created ✅"
