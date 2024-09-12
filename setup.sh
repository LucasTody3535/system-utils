#!/bin/bash

clear

echo -e "\n Starting configuration..."
echo -e " It will affect only the .bashrc file\n"

 # shellcheck disable=SC2155
readonly SU_BIN_FOLDER="$(pwd)/bin"

if ! echo "$PATH" | grep -q "$SU_BIN_FOLDER"; then
    echo "export PATH=""$PATH":"$SU_BIN_FOLDER" >> ~/.bashrc
    echo " bash environment configuration complete!"
else
    echo " bash environment already configured!"
fi
