# data/linux Touch Port
# Base Flashable With Erfan . Edit By Nobi Nobita

OUTFD=/proc/self/fd/$1;

# ui_print <text>
ui_print() { echo -e "ui_print $1\nui_print" > $OUTFD; }

# Remove Old File
rm -rf /data/ubuntu.img;

# Copy And Patch New File
mv -f /data/ubports/data/ubuntu.img /data/;
mv -f /data/ubports/data/boot.img /data/;

# Create Folder Mount
mkdir -p /data/ubuntu;

# Mount *.img to Folder Mount
mount /data/ubuntu.img /data/ubuntu;

# Umount All *.img
umount /data/ubuntu;

# rename rootfs && halium boot flash
dd if=/data/boot.img of=/dev/block/by-name/BOOT;

# Remove Install file
rm -rf /data/boot.img;
rm -rf /data/ubports;
rm -rf /data/ubuntu;

## Install Done ##
