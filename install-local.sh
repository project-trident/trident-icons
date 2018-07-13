#!/bin/sh
#Quick Script for installing icon themes directly on the local system
#  INPUTS: $1: path to installation directory (optional - only use when preparing to make a package)

install_dir="$1"
icon_themes="le-trident le-trident-dark"

#Determine the installation dir
# XDG Environment Settings
if [ -z "${install_dir}" ] ; then
  if [ "0" = `id -u` ] ; then
    if [ -z "${XDG_DATA_DIRS}" ] ; then
      #Set the default XDG environment variable
      XDG_DATA_DIRS="/share:/usr/share:/usr/local/share"
    fi
    # Scan for the icons dir in the system-level directories
    for dir in `echo "${XDG_DATA_DIRS}" | sed 's|:| |g'`
    do
      if [ -d "${dir}/icons" ] ; then
        install_dir="${dir}/icons"
        break
      fi
    done
  elif [ -n "${XDG_DATA_HOME}" ] ; then
    install_dir="${XDG_DATA_HOME}/icons"
  fi
fi
# Fallback - Home Dir
if [ -z "${install_dir}" ] ; then
  install_dir="$HOME/.local/share/icons"
fi
# Start installing the icon themes
echo "Copying Icon Themes to: ${install_dir}"
if [ ! -d "${install_dir}" ] ; then
  #Create the install dir first
  mkdir -p "${install_dir}"
fi
for theme in ${icon_themes}
do
  echo " - Install Theme: ${theme}"
  if [ -d "${install_dir}/${theme}" ] ; then
    rm -rf "${install_dir}/${theme}"
  fi
  cp -R "${theme}" "${install_dir}/${theme}"
done
echo "Done"
