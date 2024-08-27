# shellcheck disable=SC2148

#######################################
# Checks if at least one file with a
# given extension of a set of extensions
# exists
#
# Arguments:
#   A set of file extensions
# Returns:
#   0 if file was found, else 1
#
#######################################
function check_file_existence() {
    local file_extensions=("$@")
    local files=0
    for extension in "${file_extensions[@]}"; do
        # Checks existence of a given file
        # then returns 1 if true
        files=$(find ./*."${extension}" 2> /dev/null | wc -l)
        if [[ "${files}" -gt 0 ]]; then
            return 0 # Means that a file has been found
        fi
    done
    return 1 # Means that a file has not been found
}

#######################################
# Creates a directory and moves files to it
#
# Arguments:
#   $1 - A folder name
#   $2 - A string of file extensions separated by commas
#
# Globals:
#   FMT_BLUE_FONT - Defined in ansi_colors.sh
#   FMT_GREEN_FONT - Defined in ansi_colors.sh
#   FMT_RED_FONT - Defined in ansi_colors.sh
#   FMT_RESET - Defined in ansi_styles.sh
#   BASH_VERSION
#
#######################################
function move_files() {
    local dirname="$1"
    local extensions="$2"
    local file_search_action_status=1
    local files_move_action_status=1

    read -ra file_extensions <<< "${extensions}"

    check_file_existence "${file_extensions[@]}"
    file_search_action_status="$?"

    # Create directory only if there are files with the given extensions
    # else return and do not do anything
    if [[ $file_search_action_status -eq 0 ]]; then
        # Check if the folder already exists
        if [[ -d "${dirname}" ]]; then
            printf " > Folder %b%s already created%b! Moving files...\n" "${FMT_BLUE_FONT}" "${dirname}" "${FMT_RESET}"
        else
            mkdir -p "${dirname}"
            printf " > Folder %b%s created%b! Moving files...\n" "${FMT_GREEN_FONT}" "${dirname}" "${FMT_RESET}"
        fi
    else
        printf " > Folder %b%s not created%b! There are no files to put in.\n" "${FMT_RED_FONT}" "${dirname}" "${FMT_RESET}"
        return
    fi

    # Move files to the created folder
    for extension in "${file_extensions[@]}"; do
        mv ./*."${extension}" "${dirname}" 2> /dev/null # Redirecting stderr to null
        files_move_action_status="$?"
        if [[ $files_move_action_status -eq 0 ]]; then
            printf " > %bFiles with the extension .%s moved!%b\n" "${FMT_GREEN_FONT}" "${extension}" "${FMT_RESET}"
        fi
    done
}
