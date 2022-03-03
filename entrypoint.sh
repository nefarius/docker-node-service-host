#!/usr/bin/env bash
set -e

WORK_DIR=$(pwd)
INIT_DIR=/docker-entrypoint-initdb.d

cd $INIT_DIR
echo "@@ Executing bash scripts found in $INIT_DIR"
# execute scripts found in INIT_DIR
for f in $(find . -type f -name "*.sh" -executable -print | sort); do
    echo "$0: sourcing $f"
    . "$f"
    echo "$0: $f executed."
done

cd $WORK_DIR

exec "$@"
