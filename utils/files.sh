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
