#!/usr/bin/env bash

DOWNLOAD_DIRECTORY="/tmp/HP-Project-Builds/"
UDEV_RULE="SUBSYSTEM==\"usb\", ACTION==\"add\", ATTR{removable}==\"removable\", ATTR{idVendor}==\"03f0\", ATTR{idProduct}==\"2022\", ATTR{authorized}=\"0\", RUN+=\"PATH/start.sh\""

PACKAGE_LIST=(
  base-devel
  git
  curl
  wget
  cmake
  wireshark-qt
  libusb
)

GITHUB_REPOSITORIES=(
  https://github.com/wolfSSL/wolfssl.git
)

WOLFSSL_CONFIGURATION_FLAGS=(
  --enable-ecc
  --enable-ecccustcurves=all
  --enable-eccencrypt
  --enable-base64encode
  --enable-certgen
  --enable-certreq
  --enable-certext
  --enable-pkcs7
  --enable-cryptocb
  --enable-keygen
)

create_directories () {
  mkdir -p $DOWNLOAD_DIRECTORY
}

update_system () {
  sudo pacman -Syyuu --noconfirm
}

install_packages () {
  sudo pacman -S ${PACKAGE_LIST[@]} --noconfirm
}

clone_github_repositories () {
	for repository in ${GITHUB_REPOSITORIES[@]}; do
    git -C $DOWNLOAD_DIRECTORY clone $repository
	done
}

install_wolfssl () {
  cd $DOWNLOAD_DIRECTORY/wolfssl
  ./autogen.sh
  ./configure ${WOLFSSL_CONFIGURATION_FLAGS[@]}
  make
  sudo make install
}

create_udev_rule () {
  sudo sh -c "echo $UDEV_RULE > /etc/udev/rules.d/01-raspberrypi.rules"
}

create_directories
update_system
install_packages
clone_github_repositories
install_wolfssl
create_udev_rule

echo "[INFO] - Installation process finished! To ensure that everything works fine, reboot your system!"
echo "[INFO] - Don't forget to change the PATH in Udev Rule to the correct PATH of your start.sh script"

