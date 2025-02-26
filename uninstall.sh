# Uninstallation
echo "Uninstalling Acarsdec..."

# Remove RTL-SDR
sudo make uninstall -C /usr/src/rtl-sdr/build
sudo rm -rf /usr/src/rtl-sdr
sudo apt-get remove cmake git libusb-1.0 libusb-1.0-dev pkg-config rtl-sdr gr-osmosdr zlib1g-dev libxml2-dev libjansson-dev  -y

# Remove libacars-package
sudo make uninstall -C /usr/src/libacars/build
sudo rm -rf /usr/src/libacars

# Remove acarsdec
sudo make uninstall -C /usr/src/acarsdec/build
sudo rm -rf /usr/src/acarsdec

echo "Acarsdec has been uninstalled."
