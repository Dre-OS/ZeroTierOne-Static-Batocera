# Batocera installation
## Install script
 - Run script
```sh
bash <(curl -s https://raw.githubusercontent.com/Dre-OS/ZeroTierOne-Static-Batocera/main/Batocera.sh)
```

## Manual
```sh
# Create and enter zerotier data directory
mkdir ~/.zerotier-one && cd ~/.zerotier-one

# Download zerotier
curl -LJO https://github.com/Dre-OS/ZeroTierOne-Static-Batocera/releases/latest/download/zerotier-one-aarch64.tar.gz

# Unpack downloaded archive
mkdir ~/bin
tar -xzf zerotier-one-aarch64.tar.gz bin/zerotier-one -C ./bin

# Install to root bin directory
install bin/* /bin

# If you want, you can remove the archive
rm zerotier-one-aarch64.tar.gz

# Enable service
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
