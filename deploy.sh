#!/bin/bash
set -euo pipefail

# Deployment variables
REMOTE_USER="${REMOTE_USER:?Please set REMOTE_USER}"
REMOTE_HOST="${REMOTE_HOST:?Please set REMOTE_HOST}"

LOCAL_PUBLIC_HTML="./home/public_html"
REMOTE_PUBLIC_HTML="public_html"

# Check local directory is correct (should be repo root)
if [ ! -d "$LOCAL_PUBLIC_HTML" ]; then
    echo "Error: $LOCAL_PUBLIC_HTML does not exist."
    echo "Please run in repo's root"
    exit 1
fi

echo "Deploying $LOCAL_PUBLIC_HTML to $REMOTE_USER@$REMOTE_HOST:~/$REMOTE_PUBLIC_HTML"

TMP_DIR=public_html-`uuidgen`
echo "Copy files with permissions preserved..."
scp -r -p $LOCAL_PUBLIC_HTML "$REMOTE_USER@$REMOTE_HOST:~/$TMP_DIR"

ssh "$REMOTE_USER@$REMOTE_HOST" bash <<EOF
    set -euo pipefail

    echo "Clean remote directory..."
    rm -rf ./public_html || echo "./public_html does not exist already"
    echo "Move temporary public_html dir to normal one..."
    mv $TMP_DIR ./public_html
    echo "Set correct ownership..."
    GROUP=\`id -gn\`
    chown -R "\$USER:\$GROUP" ~/public_html
EOF

echo "Deployment complete"
