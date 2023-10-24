#!/bin/bash
tar -cv -I 'xz -9 -T0' -f $HOME/wine-backup.tar.xz $HOME/.wine/drive_c/users/ari/AppData && mv $HOME/wine-backup.tar.xz /mnt/network/file-store/
