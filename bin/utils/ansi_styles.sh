# shellcheck disable=SC2148
[[ "$0" =~ ansi_styles.sh ]] && echo "This script is expected to be sourced only!" && exit 1

# shellcheck disable=SC2148
# shellcheck disable=SC2034

readonly FMT_RESET='\033[0m'
