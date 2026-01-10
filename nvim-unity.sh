!/bin/bash

FILE="$1"
LINE="$2"

ghostty -e nvim "+$LINE" "$FILE"
