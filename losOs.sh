<<'COMMENT'
Format with FAT32
First, create the partition table by running the following command:
Create a Fat32 partition that takes the whole space:
Format the boot partition to FAT32:
output mkfs.fat 4.1 (2017-01-24)
Once done, use the command below to print the partition table and verify that everything is set up correctly:
https://linuxize.com/post/how-to-format-usb-sd-card-linux/
COMMENT


sudo parted /dev/sdb --script -- mklabel msdos
sudo parted /dev/sdb --script -- mkpart primary fat32 1MiB 100%
sudo mkfs.vfat -F32 /dev/sdb1
sudo parted /dev/sdb --script print

<<'COMMENT'
boot
https://esgeeks.com/crear-usb-booteable-con-terminal-linux/
visual
COMMENT

sudo dd bs=4M if=~/Descargas/linux.iso of=/dev/sdb conv=fdatasync

sudo dd if=~/Descargas/ubuntu-17.10.1-desktop-amd64.iso | pv | sudo dd of=/dev/sdb bs=4M conv=fdatasync
