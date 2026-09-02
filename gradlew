#!/bin/sh
set -e
APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
GRADLE_VERSION=8.7
GRADLE_HOME="${GRADLE_USER_HOME:-$HOME/.gradle}/wrapper/dists/gradle-${GRADLE_VERSION}-bin/local"
GRADLE_ZIP="${GRADLE_HOME}/gradle-${GRADLE_VERSION}-bin.zip"
GRADLE_DIR="${GRADLE_HOME}/gradle-${GRADLE_VERSION}"
if [ ! -x "${GRADLE_DIR}/bin/gradle" ]; then
  mkdir -p "${GRADLE_HOME}"
  if [ ! -f "${GRADLE_ZIP}" ]; then
    if command -v curl >/dev/null 2>&1; then
      curl -fsSL -o "${GRADLE_ZIP}" "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
    else
      wget -q -O "${GRADLE_ZIP}" "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
    fi
  fi
  rm -rf "${GRADLE_DIR}"
  unzip -q "${GRADLE_ZIP}" -d "${GRADLE_HOME}"
fi
exec "${GRADLE_DIR}/bin/gradle" "$@"
