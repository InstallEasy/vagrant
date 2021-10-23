#!/usr/bin/env bash

export UBUNTU="vagrant"
export DEBIAN="vagrant"
export FEDORA="vagrant"
export CENTOS="vagrant"

install_debian() {
    $SUDO apt install -y curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | $SUDO apt-key add -
    $SUDO apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    $SUDO apt update
    $SUDO apt install -y $DEBIAN
  
    echo " Packages is ready for Debian"
    echo " Finished Packages installation"
  
}

install_ubuntu() {
    $SUDO apt install -y curl
    curl -fsSL https://apt.releases.hashicorp.com/gpg | $SUDO apt-key add -
    $SUDO apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    $SUDO apt update
    $SUDO apt install -y $UBUNTU 
  
    echo " Packages is ready for Ubuntu"
    echo " Finished Packages installation"
  
}
  
install_fedora() {
    $SUDO dnf install -y dnf-plugins-core
    $SUDO config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
    $SUDO dnf update -y
    $SUDO dnf -y install $FEDORA 
  
    echo " Packages is ready for Fedora"
    echo " Finished Packages installation"
  
}

install_centos() {
    $SUDO yum install -y yum-utils
    $SUDO yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
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

