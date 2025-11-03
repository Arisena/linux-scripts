#!/bin/bash
tar -c --use-compress-program=pigz --exclude="Local/Temp" --exclude="Local/Low" --exclude="Microsoft" --exclude="vortex-updater" --exclude="Vortex" --exclude="Dameware Remote Everywhere" --exclude="Battle.net" -vf $HOME/wine-backup.tar.gz $HOME/.wine/drive_c/users/$USER/AppData
#tar -c --use-compress-program=pigz --exclude="$HOME/.wine/drive_c/users/$USER/AppData/Roaming/Vortex" --exclude="$HOME/.wine/drive_c/users/$USER/AppData/Local/Dameware Remote Everywhere" -vf $HOME/wine-backup.tar.gz $HOME/.wine/drive_c/users/$USER/AppData
mv -v /mnt/network/file-store/wine-backup.tar.gz /mnt/network/file-store/wine-backup-old.tar.gz
mv -v $HOME/wine-backup.tar.gz /mnt/network/file-store/
