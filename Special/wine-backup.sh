#!/bin/bash
#tar --exclude='*vortex*' --exclude='*Vortex*' -cv -I 'xz -9 -T0' -f $HOME/wine-backup.tar.xz $HOME/.wine/drive_c/users/ari/AppData
tar --exclude='*vortex*' -cvJf $HOME/wine-backup.tar.xz $HOME/.wine/drive_c/users/ari/AppData
mv -v /mnt/network/file-store/wine-backup.tar.xz /mnt/network/file-store/wine-backup-old.tar.xz
mv -v $HOME/wine-backup.tar.xz /mnt/network/file-store/
