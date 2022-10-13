# PortMaster-Batocera
## Introduction
 Batocera compatible PortMaster Implementation

 I think in the near future PortMaster will be ported onto Batocera but for now, out of the box PortMaster does not work on Batocera (v35). The device I use is an Ondroid Go Super with a USB WiFi dongle.

 I am no bash scripting or Linux expert by any means, but it seems like there are two issues with the current implementation that prevents the PortMaster to run on Batocera:

 1. The included (possibly for cosmetic reasons) wget app does not work as is. Required libidn2.so.0 shared library does not exist. I tried to bring this dependency into this repo but I could not make it work, although I found the library and copied over. There are some issues running ln -s on Batocera to create the required symlinks in the libs folder, at least it seems like on my handheld device. I also tried to create the symlinks in /usr/lib but that also did not work, although I was able to create the symlinks there, wget app did not respect the existence of the library. So, I simply replaced wget with curl so that the required files could be downloaded onto the device. Now the PortMaster app cannot display the progress of a download, but I do not think it is a showstopper.
 2. The path references within the PortMaster.sh and the game ports' .sh installation files does not point to /userdata/roms/ports. To workaround this issue, I included a piece of code and a custom script that creates a symlink in the root directory called "/storage" which effectively points to "/userdata". In this way, we can simply reuse the game ports' zip files from the original repo without any changes.

 This version of the PortMaster app still references to the original repo with regards to game list and required support files. I have disabled the Auto-Update feature for now, as that needs to be tackled separately.

## Steps to install PortMaster
1. Download the repo as ZIP using the green button on the right and up side of this page. (Code > Download ZIP)
2. Extract ZIP on your computer
3. SFTP into your Batocera installed device
4. Browse to /userdata/roms/ and create a folder called *ports* if it is not there
5. Transfer the *PortMaster* folder from the extracted ZIP file into the *ports* folder you just created on the device
6. Transfer the *custom.sh* file into */userdata/system*. This script creates the required */storage* symlink on reboot
6. Reboot Batocera installed device (handheld, etc)
7. Browse to *Ports* category on Batocera
8. PortMaster should be listed now. Launch it.
9. PortMaster should launch with no issues. From this step onwards you can follow online tutorials to install game ports.

## Installing Games
Some games are already included as part of the PortMaster and can be downloaded and played immediately. Other games which require a purchase needs to follow the process where it is explained on guides available online.

Tutorial for installing Timespinner game port:
[Retro Game Corps - Timespinner tutorial](https://www.youtube.com/watch?v=rDv0ZmB0l7I) You can skip the part where the OS and PortMaster are being updated.

More tutorials can be found on YouTube or [here](https://github.com/christianhaitian/PortMaster/wiki)
