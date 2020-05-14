#!/bin/bash

function SedRegexSourceEscape() {
  local STR="$1"
  STR="${STR//\//\\\/}"
  echo -n "$STR"
}

function RegexTargetEscape() {
  local STR="$1"
  STR="${STR//\\/\\\\}"
  STR="${STR//\//\\\/}"
  echo -n "$STR"
}

FOUND="$(ag -0 -l -- "$1" | xargs -0 echo)" \
  && echo "$FOUND" | xargs sed -i.bak -e "s/$(SedRegexSourceEscape $1)/$(RegexTargetEscape $2)/g"

