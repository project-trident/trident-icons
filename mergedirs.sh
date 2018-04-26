#!/bin/sh

#INPUTS: $1 from dir, $2 target dir
from_dir="$1"
dest_dir="$2"
replace="$3"
for file in `ls ${from_dir}`
do
  if [ -e "${dest_dir}/${file}" ] ; then
    if [ "${replace}" = "true" ] ; then
      git rm -f "${dest_dir}/${file}"
    else
      continue
    fi
  fi
  git mv "${from_dir}/${file}" "${dest_dir}/${file}"
done
