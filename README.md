# SCDF-dwm
custom build of dwm tailored for SCDF

## Installation

### Arch linux

If you are on arch you can either choose to add [My custom repository](https://github.com/Scraft161/SCDF-pacman?tab=readme-ov-file#add-to-your-system) to your `pacman.conf` and install the pre-compiled version that way or download this repository and install like any other AUR package using the instructions below.

#### Installing from source

```sh
git clone https://github.com/Scraft161/SCDF-dwm
cd SCDF-dwm
makepkg -si
```

After this SCDF-dwm should be installed.  
If you wish to make any changes however please look at our [Manual installation](#manual-installation) section.

### Manual installation

tl;dr: you can get the standard SCDF setup with the following commands:
```sh
git clone https://github.com/Scraft161/SCDF-dwm
cd SCDF-dwm
./configure
./patch.sh
cd src/dwm-6.5
sudo make clean install
```

---

We recommend people only use the manual installation if they do not run arch linux or wish to make changes to the default setup.

First clone and prepare the repository.
```sh
git clone https://github.com/Scraft161/SCDF-dwm
cd SCDF-dwm
./configure
```

This will download all the assets used for building DWM.

After running `configure` you can then either choose to manually patch everything or use `patch.sh`.

`patch.sh` is a simple shell script that applies patches from a list, you can modify the list to include or exclude patches; but you will most likely need to manually apply patches if you deviate from the default setup.

After running `patch.sh` in it's default state you will now have the source to the standard SCDF-dwm which you can further modify to suit your needs.

When you are done modifying you can then `cd` into `src/dwm-6.5` and run `sudo make clean install` to build and install dwm.
