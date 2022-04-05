#!/bin/bash

atualizar_tudo () {
	echo "[INFO] - APT UPDATE"
	sudo apt update 
	echo "[INFO] - APT UPGRADE"
	sudo apt upgrade -y
	echo "[INFO] - APT DIST-UPGRADE"
	sudo apt dist-upgrade -y
	echo "[INFO] - APT AUTOCLEAN"
	sudo apt autoclean -y 
	echo "[INFO] - APT AUTOREMOVE"
	sudo apt autoremove -y
  echo "[INFO] - FLATPAK UPDATE"
  flatpak update -y
}

atualizar_tudo
