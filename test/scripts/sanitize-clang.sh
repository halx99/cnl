#!/usr/bin/env bash

# Configure, build and run all tests with UBSan and MSan enabled, assuming a Clang toolchain

set -euo pipefail

export LSAN_OPTIONS=verbosity=1:log_threads=1
PROJECT_DIR=$(
  cd "$(dirname "$0")"/../..
  pwd
)

"${PROJECT_DIR}/test/scripts/test-all.sh" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCNL_INT128=ON \
  -DCNL_SANITIZE=ON \
  "$@"