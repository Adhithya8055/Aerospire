#!/bin/bash

#About
clear
echo -e "\033[1;36m Acars complete installation on Raspbian, Kali Linux, and Ubuntu"
echo "-----------------------------------------------------------------"
echo "" 
sleep 3
echo -e "\033[1;33mDisclaimer: The following installation packages and repositories in this installation belong to their respective owners."

# Install RTL-driver
echo "\033[0;32m installing rtl-driver"
if ! command -v apt-get > /dev/null; then
    sudo apt install cmake git pkg-config rtl-sdr gr-osmosdr libusb-1.0-0-dev -y
else
    sudo apt-get install cmake git pkg-config rtl-sdr gr-osmosdr libusb-1.0-0-dev -y
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
echo "\033[0;36m For information on how to use Acarsdec, please refer to the ACARSDEC by TLeconte in github for usage instruction."

