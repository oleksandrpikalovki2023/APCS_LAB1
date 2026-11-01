#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

if ! command -v java >/dev/null 2>&1; then
    echo "ERROR: Java 17 or newer is required but was not found on PATH." >&2
    exit 1
fi

if ! command -v mvn >/dev/null 2>&1; then
    echo "ERROR: Apache Maven is required but was not found on PATH." >&2
    exit 1
fi

echo "[INFO] Building the project and running unit tests..."
mvn --batch-mode --no-transfer-progress clean verify

mkdir -p build
cp target/hello-world-1.0.0.jar build/hello.jar
cp scripts/hello.sh build/hello
cp scripts/hello.bat build/hello.bat
chmod +x build/hello

echo "[INFO] Verifying the generated launcher..."
actual_output=$(build/hello)
if [ "$actual_output" != "Hello, World!" ]; then
    echo "ERROR: Expected 'Hello, World!' but got '$actual_output'." >&2
    exit 1
fi

echo "$actual_output"
echo "[OK] Build, tests, and launcher verification passed."
