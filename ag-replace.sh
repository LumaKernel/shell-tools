#!/bin/bash

FOUND="$(ag -0 -l -- "$1" | xargs -0 echo)" \
  && echo "$FOUND" | xargs sed -i.bak -e "s/$1/$2/g"

