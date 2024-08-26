#!/bin/bash

clear

echo -e "\n Starting configuration..."
echo -e " It will affect only the .bashrc file\n"

if [[ -z "$SU_UTILS_FOLDER" ]]; then

    # shellcheck disable=SC2155
    readonly SU_UTILS_FOLDER=$(pwd)"/utils"

    echo "export SU_UTILS_FOLDER=""$SU_UTILS_FOLDER" >> ~/.bashrc
    echo -e "  > Configured SU_UTILS_FOLDER!\n"
else
    echo -e "  > Already configured SU_UTILS_FOLDER!\n"
fi

if [[ -z "$SU_BIN_FOLDER" ]]; then

    # shellcheck disable=SC2155
    readonly SU_BIN_FOLDER=$(pwd)"/bin"

    echo "export SU_BIN_FOLDER=""$SU_BIN_FOLDER" >> ~/.bashrc
    echo "export PATH=""$PATH":"$SU_BIN_FOLDER" >> ~/.bashrc
    echo -e "  > Configured SU_BIN_FOLDER!\n"
else
    echo -e "  > Already configured SU_BIN_FOLDER!\n"
fi

echo "  > Apply changes to the current shell with source ~/.bashrc"
