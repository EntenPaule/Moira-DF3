#!/bin/bash

CORES=$(grep -c processor /proc/cpuinfo)

sudo service klipper stop
cd ~/klipper

# Update mcu rpi
echo "Start update mcu rpi"
echo ""
#make clean KCONFIG_CONFIG=/home/pi/klipper_config/script/config.host
#make menuconfig KCONFIG_CONFIG=/home/pi/klipper_config/script/config.host
#make -j $CORES KCONFIG_CONFIG=/home/pi/klipper_config/script/config.host
read -p "mcu rpi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
#make flash KCONFIG_CONFIG=/home/pi/klipper_config/script/config.host
echo "Finish update mcu rpi"
echo ""

# Update mcu mcu
echo "Start update mcu mcu"
echo ""
make clean KCONFIG_CONFIG=/home/pi/klipper_config/script/config.skrmini
#make menuconfig KCONFIG_CONFIG=/home/pi/klipper_config/script/config.skrmini
make -j $CORES KCONFIG_CONFIG=/home/pi/klipper_config/script/config.skr13mini
read -p "mcu firmware built, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"
./scripts/flash-sdcard.sh /dev/ttyAMA0 btt-skr-mini
echo "Finish update mcu XYE"
echo ""

sudo service klipper start
