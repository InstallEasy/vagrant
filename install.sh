#!/usr/bin/env bash

export UBUNTU=""
export DEBIAN=""
export FEDORA=""
export CENTOS=""

  install_debian() {
    $SUDO apt update
    $SUDO apt install -y $DEBIAN
  
    echo " Packages is ready for Debian"
    echo " Finished Packages installation"
  
  }

  install_ubuntu() {
    $SUDO apt update
    $SUDO apt install -y $UBUNTU 
  
    echo " Packages is ready for Ubuntu"
    echo " Finished Packages installation"
  
  }
  
  install_fedora() {
    $SUDO dnf update -y
    $SUDO dnf -y install $FEDORA 
  
    echo " Packages is ready for Fedora"
    echo " Finished Packages installation"
  
  }

  install_centos() {
    $SUDO dnf update -y
    $SUDO dnf -y install $CENTOS
  
    echo " Packages is ready for CentOS"
    echo " Finished Packages installation"
  
  }
  
  usage() {
    echo
    echo "Linux distribution not detected"
    echo "Use: ID=[debian|ubuntu|fedora|centos]"
    echo "Other distribution not yet supported"
    echo
  
  }
  
  if [ -f /etc/os-release ]; then
    . /etc/os-release
  elif [ -f /etc/debian_version ]; then
    $ID=debian
  fi
  
  if [[ $EUID -ne 0 ]]; then
    SUDO='sudo -H'
  else
    SUDO=''
  fi
  
  case $ID in
          'debian')
                  install_debian
          ;;
          'ubuntu')
                  install_ubuntu
          ;;
          'fedora')
                  install_fedora
          ;;
          'centos')
                  install_centos
          ;;
          *)
            usage
          ;;
esac

