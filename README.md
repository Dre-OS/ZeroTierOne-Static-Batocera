# ZeroTier-One static binaries
This project provides static [Zerotier-One](https://github.com/zerotier/ZeroTierOne) binaries.

# Setup
*To install ZeroTier-One on Batocera you can follow: [Batocera](Batocera.md)*

*in batocera `batocera-save-overlay` is needed to save modified system files, for more info, please see: [Batocera Wiki](https://wiki.batocera.org/modify_the_system_while_it_s_running)*

*For x86_64 Versions of Batocera, please use zerotier-one-x86_64.tar.gz*

# Updating

## Removing Previous install
remove binaries from the /usr/bin
```sh
cd /usr/bin
rm zerotier-one zerotier-one zerotier-cli zerotier-idtool

```
Download latest release:
```sh
SYS_ARCH=$(arch) | curl -LJO https://github.com/Dre-OS/ZeroTierOne-Static-Batocera/releases/latest/download/zerotier-one-$SYS_ARCH.tar.gz
```
## Update
install it to bin:
```sh
mkdir ~/bin
SYS_ARCH=$(arch) | tar -xzf zerotier-one-$SYS_ARCH.tar.gz bin/zerotier-one -C ./bin
install bin/* /usr/bin
```

And create symlinks for zerotier-cli and zerotier-idtool:
```sh
cd /usr/bin
ln -s zerotier-one zerotier-cli
ln -s zerotier-one zerotier-idtool
```

Finally, save overlay:
```sh
batocera-save-overlay
```

# Building
To build latest version run:
```sh
make
```
To build specific version, set variable:
```sh
make ZT_VERSION=1.10.1
```
