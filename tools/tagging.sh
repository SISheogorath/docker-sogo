#!/bin/sh

if [ "$1" = "--help" ]; then
    echo "
    Usage of $0:
        $0 <PREFIX> <VERSION> <SUFFIX>

    Example:
        $0 sogo 2.0.24 alpine
    "
fi

PREFIX=${1:-sogo}
VERSION=${2}
[ "${3}" != "" ] && [ "${3}" != "debian" ] && SUFFIX="-${3}"



if [ "$VERSION" != "" ]; then
    docker tag sogo:testing "$PREFIX:$(echo "${VERSION}" | sed -e 's/^v//' | cut -d. -f1)${SUFFIX}"
    docker tag sogo:testing "$PREFIX:$(echo "${VERSION}" | sed -e 's/^v//' | cut -d. -f1-2)${SUFFIX}"
    docker tag sogo:testing "$PREFIX:$(echo "${VERSION}" | sed -e 's/^v//' | cut -d. -f1-3)${SUFFIX}"
    [ "$SUFFIX" = "" ] && docker tag sogo:testing "$PREFIX:latest"
else
    echo "No version provided. Skipping tagging..."
fi
