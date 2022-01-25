#!/usr/bin/env zsh

# TechPreview版のため正規版になった際に削除
# brew uninstall vmware-fusion-tech-preview; brew install vmware-fusion;
ln -s /Applications/VMWare\ Fusion\ Tech\ Preview.app /Applications/VMWare\ Fusion.app

# https://www.vagrantup.com/docs/providers/vmware/installation
vagrant plugin install vagrant-vmware-desktop