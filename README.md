# ZeroTier-One static binaries
This project provides static [Zerotier-One](https://github.com/zerotier/ZeroTierOne) binaries.

# Setup
*To install ZeroTier-One on Batocera you can follow: [Batocera](Batocera.md)*

*in batocera `batocera-save-overlay` is needed to save modified system files, for more info, please see: [Batocera Wiki](https://wiki.batocera.org/modify_the_system_while_it_s_running)*

Download latest release:
```sh
curl -LJO https://github.com/Dre-OS/ZeroTierOne-Static-Batocera/releases/latest/download/zerotier-one-aarch64.tar.gz
```

install it to bin:
```sh
mkdir ~/bin
tar -xzf zerotier-one-aarch64.tar.gz bin/zerotier-one -C ./bin
cd ~/bin
cd ..
install bin/* /bin
```

And create symlinks for zerotier-cli and zerotier-idtool:
```sh
cd /bin
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
