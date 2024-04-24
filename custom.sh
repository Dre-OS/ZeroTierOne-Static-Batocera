#!/bin/bash
# Code here will be executed on every boot and shutdown.
#logging
exec >custom.log 2>&1

chmod u+x zerotier-one
chmod u+x zerotier-cli

LINK_OR_DIR="/var/lib/zerotier-one"
DEST_DIR="/userdata/system/configs/zerotier"

createConfig(){
  zerotier-one
  if [ ! -d "$DEST_DIR" ]; then
	  mkdir "$DEST_DIR"
  fi
  mv "$LINK_OR_DIR/"* "$DEST_DIR"
  rm $LINK_OR_DIR
  ln -s "$DEST_DIR" "$LINK_OR_DIR"
  pkill zerotier-one
  zerotier-one
}

verifyDest(){
  if [ -d "$DEST_DIR" ]; then
	  ln -s "$DEST_DIR" "$LINK_OR_DIR"
  fi
  zerotier-one
}

if [[ ! -d "$LINK_OR_DIR" && -d "$DEST_DIR" ]]; then 
  verifyDest
elif [[ ! -d "$LINK_OR_DIR" && ! -d "$DEST_DIR" ]]; then
  createConfig
else
  echo "ERROR: could not determine directories or links"
fi

