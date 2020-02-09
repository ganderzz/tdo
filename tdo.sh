#!/bin/bash

# Variables
OUTPUT_DIRECTORY="./notes"
CURRENT_FILENAME="notes-$(date +%F).txt"

OUTPUT_FILE="${OUTPUT_DIRECTORY}/${CURRENT_FILENAME}"

OFF="\033[0m"
CYAN="\033[1;32m"

# Setup -- create directory if it doesn't exist and file for today
if [ ! -d "${OUTPUT_DIRECTORY}" ]; then
  mkdir $OUTPUT_DIRECTORY
fi

if [ ! -d "${OUTPUT_FILE}" ]; then
  touch "$OUTPUT_FILE"
fi

# Match action and perform
case "$1" in
  ("add")
    if [ "$#" -lt 3 ]; then
      echo $2 >> "$OUTPUT_FILE"
    else
      echo "Too many parameters, are you missing quotes around the second argument?"
    fi
  ;;

  ("delete")
    if [ "$#" -gt 1 ]; then
      sed -i '' -e "$2d" "$OUTPUT_FILE"
    else
      echo "Missing line number."
    fi
  ;;

  ("check")
    if [ "$#" -gt 1 ]; then
      sed -E -i '' "$2s/^[^[].*/\[\*\] &/" "$OUTPUT_FILE"
    else
      echo "Missing line number."
    fi
  ;;

  ("uncheck")
    if [ "$#" -gt 1 ]; then
      sed -E -i '' "$2s/^\[\*\] //" "$OUTPUT_FILE"
    else
      echo "Missing line number."
    fi
  ;;

  ("open")
    # Opens the directory containing the notes
    # Windows uses `explorer` and Unix uses `open`
    if [ "$OSTYPE" == "cygwin" -o "$OSTYPE" == "msys" -o "$OSTYPE" == "win32" ]; then
      explorer "${OUTPUT_DIRECTORY}"
    else
      open "${OUTPUT_DIRECTORY}"
    fi
  ;;

  ("help")
    echo -e "
$0
commands: 
  ${CYAN}add${OFF} \"input to add\" - [add a todo item]
  ${CYAN}check${OFF} {linenumber} - [checks off an item by line number (1-n)]
  ${CYAN}uncheck${OFF} {linenumber} - [unchecks an item by line number (1-n)]
  ${CYAN}open${OFF} - [opens the directory containing notes]
  ${CYAN}help${OFF} - [print help output]
  " 
  ;;

  (*)
    cat -n "$OUTPUT_FILE" 
  ;;
esac