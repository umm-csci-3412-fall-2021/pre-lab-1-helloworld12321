#!/usr/bin/env bash

# Add text to the start and end of a file.

usage='Usage: ./wrap_contents.sh input_file wrapper_name output_file'

# input_file is the file we're going to add a header and footer to.
#
# wrapper_name is a string prefix. If `wrapper_name` is "frogs",
# this script searches for files named frogs_header.html and frogs_footer.html
# in the current directory, and uses their contents as the header and footer
# text.
#
# output_file is where we'll put the text with header and footer added. If this
# file already exists, it will be overwritten.

if [[ $# -ne 3 ]]; then
  echo "$usage" >&2
  exit 1
fi

input_file="$1"
wrapper_name="$2"
output_file="$3"

# Check to make sure that all the necessary files exist and are readable.
for file in \
  "$input_file" \
  "${wrapper_name}_header.html" \
  "${wrapper_name}_footer.html"
do
  if [[ ! -f "$file" ]]; then
    echo "Error: cannot find file: ${file}" >&2
    exit 1
  fi
  if [[ ! -r "$file" ]]; then
    echo "Error: cannot access file: ${file}" >&2
    exit 1
  fi
done

cat \
  "${wrapper_name}_header.html" \
  "$input_file" \
  "${wrapper_name}_footer.html" \
  >"$output_file"
