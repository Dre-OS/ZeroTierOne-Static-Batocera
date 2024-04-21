#!/bin/sh

LINK_OR_DIR="/usr/lib/zerotier-one"
DEST_DIR="/userdata/system/configs/zerotier"
SYS_ARCH=$(arch)

# logging
bash 2>&1 | tee ~/batocera.log

# Download zerotier
if [ $SYS_ARCH == "aarch64" ]; then
    curl -LJO https://github.com/Dre-OS/ZeroTierOne-Static-Batocera/releases/latest/download/zerotier-one-aarch64.tar.gz
elif [ $SYS_ARCH == "x86_64" ]; then
    curl -LJO https://github.com/Dre-OS/ZeroTierOne-Static-Batocera/releases/latest/download/zerotier-one-x86_64.tar.gz
else
    echo ERROR: Unsupported system architecture
    exit 1 # terminate and indicate error
fi

# Unpack downloaded archive
mkdir ~/bin
tar -xzf zerotier-one-aarch64.tar.gz bin/zerotier-one -C ./bin

# Install to root bin directory
install bin/* /usr/bin

# If you want, you can remove the archive
rm zerotier-one-aarch64.tar.gz

# add links to cli and idtool
cd "/usr/bin" || exit
ln -s zerotier-one zerotier-cli
ln -s zerotier-one zerotier-idtool

# save overlay
batocera-save-overlay

# Generate configs
zerotier-one
pkill zerotier-one

# Add configs to /userdata/system
mv "$LINK_OR_DIR" "$DEST_DIR"
ln -s "$DEST_DIR" "$LINK_OR_DIR"

# Start Zerotier
zerotier-one