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

cat /vendor/ueventd*.rc | grep ^/dev | sed -e 's/^\/dev\///' | awk '{printf "ACTION==\"add\", KERNEL==\"%s\", OWNER=\"%s\", GROUP=\"%s\", MODE=\"%s\"\n",$1,$3,$4,$2}' | sed -e 's/\r//' > /data/ubuntu/etc/udev/rules.d/70-exynos7870.rules

# Umount All *.img
umount /data/ubuntu;

# rename rootfs && halium boot flash
dd if=/data/boot.img of=/dev/block/by-name/BOOT;

# Remove Install file
rm -rf /data/boot.img;
rm -rf /data/ubports;
rm -rf /data/ubuntu;

## Install Done ##
