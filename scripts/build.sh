#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p build/classes dist
find src/main/java -name '*.java' -print > build/sources.txt
javac --release 17 -encoding UTF-8 -d build/classes @build/sources.txt
jar --create --file dist/Jamb-Multiplayer.jar --main-class com.jamb.Main -C build/classes .
echo 'Built dist/Jamb-Multiplayer.jar'
