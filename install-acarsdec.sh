#About
clear
echo "\033[1;36m Acars complete installation on kali linux for RTL-SDR "
echo '--------------------------------------------------------------'
sleep 3
echo "\033[1;33m disclaimer: The following installation packages & repositories in this installation belongs to their respective owners." 
sleep 4


#updating packages
sudo apt update
clear


#Installing RTL-driver
echo "\033[0;32m installing rtl-driver"
sudo apt-get install cmake git libusb-1.0 libusb-1.0-0.dev pkg-config rtl-sdr gr-osmosdr -y
clear
git clone https://github.com/osmocom/rtl-sdr.git
cd /home/kali/rtl-sdr/
mkdir build
cd build/
sleep 2
sudo cmake ../ -DDETACH_KERNEL_DRIVER=ON -DINSTALL_UDEV_RULES=ON
sleep 2
clear
sudo make
clear
sleep 2
sudo make install
sleep 2
sudo ldconfig


#Installing libacars-package
clear
echo "\033[0;32m installing libacars-package"
cd /home/kali/
git clone https://github.com/szpajder/libacars.git
cd /home/kali/libacars
mkdir build
cd build
sudo cmake ..
sleep 2
sudo make
sleep 2
sudo make install


#Installing acarsdec
clear
cd /home/kali/
echo "\033[0;32m installing acarsdec"
git clone https://github.com/TLeconte/acarsdec.git
cd /home/kali/acarsdec
mkdir build
cd build/
sleep 4
sudo cmake .. -Drtl=ON
clear
sleep 4
sudo make
clear
sleep 4
sudo make install
sleep 4
ldconfig


#Instruction
echo "\033[0;36m Find the instruction on how to run acarsdec in README.md"
