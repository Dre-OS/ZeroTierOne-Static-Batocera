# Batocera installation
## Install script 
 - Add initializing script (custom.sh)
```sh
curl https://raw.githubusercontent.com/Dre-OS/ZeroTierOne-Static-Batocera/main/custom.sh >> custom.sh
```
 - Run script
```sh
bash <(curl -s https://raw.githubusercontent.com/Dre-OS/ZeroTierOne-Static-Batocera/main/Batocera.sh)
```

## Manual
*For x86_64 Versions of Batocera, please use zerotier-one-aarch64.tar.gz*
```sh

# Download zerotier
curl -LJO https://github.com/Dre-OS/ZeroTierOne-Static-Batocera/releases/latest/download/zerotier-one-aarch64.tar.gz

# Unpack downloaded archive
mkdir ~/bin
tar -xzf zerotier-one-aarch64.tar.gz bin/zerotier-one -C ./bin

# Install to root bin directory
install bin/* /bin

# If you want, you can remove the archive
rm zerotier-one-aarch64.tar.gz

# Generate configs
zerotier-one
pkill zerotier-one

# Add configs to /userdata/system
mv "$LINK_OR_DIR" "$DEST_DIR"
ln -s "$DEST_DIR" "$LINK_OR_DIR"

# Start Zerotier
zerotier-one
```

## Use CLI

After the installation the cli can be used as following on SSH

```
zerotier-cli <command>
```

to see all commands use 

```
zerotier-cli -h
```
