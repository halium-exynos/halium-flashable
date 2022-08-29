# data/linux Touch Port
# Base Flashable With Erfan . Edit By Nobi Nobita

OUTFD=/proc/self/fd/$1;

# ui_print <text>
ui_print() { echo -e "ui_print $1\nui_print" > $OUTFD; }

## data/linux Touch Install For Whyred

# Remove Old File
rm -rf /data/vendor.img;
rm -rf /data/ubuntu.img;

# Copy And Patch New File
mv -f /data/ubports/data/ubuntu.img /data/;
mv -f /data/ubports/data/vendor.img /data/;
mv -f /data/ubports/data/boot.img /data/;

# Create Folder Mount
mkdir -p /data/linux/Rootfs;
mkdir -p /data/linux/System;
mkdir -p /data/linux/Vendor;

# Mount *.img to Folder Mount
mount /data/ubuntu.img /data/linux/Rootfs;
mount /data/linux/Rootfs/var/lib/lxc/android/android-rootfs.img /data/linux/System;
mount /data/vendor.img /data/linux/Vendor;

# Create EFS Like Samsung ( Fix Erfan Rootfs )
mkdir -p /data/linux/System/efs;

# Umount All *.img
umount /data/linux/Rootfs;
umount /data/linux/System;
umount /data/linux/Vendor;

# rename rootfs && halium boot flash
dd if=/data/boot.img of=/dev/block/platform/13540000.dwmmc0/by-name/BOOT;

# Remove Install file
rm -rf /data/boot.img;
rm -rf /data/ubports;
rm -rf /data/linux;

## Install Done ##
