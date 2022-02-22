# Grocy-Debian
Install script for Grocy on fresh Debian install

Project Source: https://github.com/grocy/grocy

## VM Configuration:
* Debian ([Link to ISO](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso))
* 206MB ram
* 1 CPU core
* ~5GB hard drive (1.3GB used)

## One Line Installer:
```
curl -sSL https://raw.githubusercontent.com/Will711990/Grocy-Debian/main/install.sh | bash
```

## Initial Configure:
* Login with admin/admin

* Click wrench (top right) -> Manage API keys -> Add
  * Copy API key to Android App (https://github.com/patzly/grocy-android)
  
* Click wrench (top right) -> Manage Users -> Edit "Admin"
  * Change username
  * Change password
