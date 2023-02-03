#!/bin/bash
export PATH=${PATH}:${HOME}/edirect
while read line; do
  seq=$(esearch -db genome -query $line < /dev/null \
  | elink -target nuccore \
  | efetch -format fasta
  echo $seq
done

for org in \
  "Acidaminococcus fermentans"
do
  esearch -db assembly -query "$org [ORGN]" \
  | efilter -query "representative [PROP]" \
  | elink -target nuccore -name assembly_nuccore_refseq \
  | efetch -format fasta


