#!/usr/bin/env bash

# Reformat some input files.

out_format='1. \1\n2. \2\n'

in_format_0='^\* ([^,]+), (.+)$'
sed -E "s/${in_format_0}/${out_format}/" <r0_input.txt >r0_output.txt

in_format_1='^\* I am ([^.]+). My favorite sandwich is ([^.]+).$'
grep -E "$in_format_1" <r1_input.txt \
  | sed -E "s/${in_format_1}/${out_format}/" >r1_output.txt

in_format_2='^\* sandwich with (\S+) (.+)$'
sed -E "s/${in_format_2}/${out_format}/" <r2_input.txt >r2_output.txt
