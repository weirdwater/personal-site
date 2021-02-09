#!/bin/bash

# Unofficial strict mode
set -euo pipefail
IFS=$'\n\t'

#/ Usage: ./deploy.sh
#/ Description: Will build hugo site and deploy it to the server. Make sure you have ssh access to the remote server.
#/ Examples:
#/ Options
#/   --help will display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

CRED='\033[0;31m'
CYAN='\033[0;36m'
YLLW='\033[1;33m'
NC='\033[0m'

readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo -e "${CYAN}[INFO]    $* ${NC}" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo -e "${YLLW}[WARNING] $* ${NC}" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo -e "${CRED}[ERROR]   $* ${NC}" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo -e "${CRED}[FATAL]   $* ${NC}" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

project="personal-site"
server="arjobruijn.es"
remoteDir="/var/www/arjobruijn.es"
build=$(date "+%Y%m%d%H%M")
branch=$(git rev-parse --abbrev-ref HEAD)
commit=$(git log -n 1 --pretty=format:"%H")
release="${project}@${commit}"

cleanup() {
  info "Cleanup"
  rm -rf ./public
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
  # TODO: Exit with help message if the user cannot connect to the remote server
  # TODO: Add flag for just building the docker image (+ archive) ?
	trap cleanup EXIT

  info "Starting build ${build} for ${project}"
  hugo && rsync -avzO --no-p --delete public/ ${server}:${remoteDir}

fi
