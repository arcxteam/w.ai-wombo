#!/usr/bin/env bash

# -------------------------------------------------
# Name: setupnodejs.sh
# Description: Bootstrap install Node.js, npm, Yarn, and PM2
# Platform: Linux (Ubuntu/Debian)
# -------------------------------------------------

# Install NVM
echo "Installing NVM (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# load environment NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Node.js
echo "Installing Node.js v22.22.0 (LTS)..."
nvm install 22.22.0
nvm use 22.22.0
nvm alias default 22.22.0

echo "Verifying Node.js and npm installation..."
node -v
npm -v

# Install PM2
echo "Installing PM2..."
npm install -g pm2

echo "Verifying PM2 installation..."
pm2 -v

# Install Yarn
echo "Installing Yarn..."
npm install -g yarn

echo "Verifying Yarn installation..."
yarn -v

# add to .bashrc
echo "Adding NVM to .bashrc..."
cat <<EOF >> ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"
EOF

# reload .bashrc
source ~/.bashrc

echo "Setting proper permissions for NVM and Node.js installation..."
chown -R $USER:$USER ~/.nvm
chmod -R 755 ~/.nvm

# Ready version help
echo "Installation completed successfully."
echo "Node.js version: $(node -v)"
echo "Npm version: $(npm -v)"
echo "PM2 version: $(pm2 -v)"
echo "Yarn version: $(yarn -v)"
