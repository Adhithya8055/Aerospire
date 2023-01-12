#!/bin/bash

#About
clear
echo "\033[1;36m Acars complete installation on Raspbian, Kali Linux, and Ubuntu "
echo '--------------------------------------------------------------'
sleep 3
echo "\033[1;33m disclaimer: The following installation packages & repositories in this installation belongs to their respective owners." 
sleep 4

# Update package list
sudo apt update

# Install RTL-driver
echo "\033[0;32m installing rtl-driver"
if ! command -v apt-get > /dev/null; then
    sudo apt install cmake git libusb-1.0 libusb-1.0-dev pkg-config rtl-sdr gr-osmosdr -y
else
    sudo apt-get install cmake git libusb-1.0 libusb-1.0-dev pkg-config rtl-sdr gr-osmosdr -y
fi

# Clone the repository for RTL-SDR
sudo mkdir -p /usr/src/rtl-sdr
sudo git clone https://github.com/osmocom/rtl-sdr.git /usr/src/rtl-sdr

# Build and install RTL-SDR
cd /usr/src/rtl-sdr
sudo mkdir build
cd build
sudo cmake ../ -DDETACH_KERNEL_DRIVER=ON -DINSTALL_UDEV_RULES=ON
sudo make
sudo make install
sudo ldconfig

# Install libacars-package
echo "\033[0;32m installing libacars-package"
sudo mkdir -p /usr/src/libacars
sudo git clone https://github.com/szpajder/libacars.git /usr/src/libacars
cd /usr/src/libacars
sudo mkdir build
cd build
sudo cmake ..
sudo make
sudo make install

# Install acarsdec
echo "\033[0;32m installing acarsdec"
sudo mkdir -p /usr/src/acarsdec
sudo git clone https://github.com/TLeconte/acarsdec.git /usr/src/acarsdec
cd /usr/src/acarsdec
sudo mkdir build
cd build
sudo cmake .. -Drtl=ON
sudo make
sudo make install
sudo ldconfig

# Instruction
echo "\033[0;36m Find the instruction on how to run acarsdec in README.md"

