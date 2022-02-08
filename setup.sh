#!/bin/bash

    #Update and Upgrade
    sudo apt update
    sudo apt upgrade

    #Install Curl
    sudo apt install apt-transport-https curl

    #Install Brave-Browser
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser

    #Install VisualStudioCode
    sudo apt install code

    #Install Insomnia
    sudo apt install insomnia

    #Install Beekeeper-Studio
    sudo apt install beekeeper-studio

    #Install Flameshot
    sudo apt install flameshot

    #Install Diodon
    sudo apt install diodon

    #Install Piper
    sudo apt install piper

    #Install Timeshift
    sudo apt install timeshift

    #Install and Enable Flatpak Support
    sudo apt install flatpak
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    #Install Spotify in Flatpak
    flatpak install flathub com.spotify.Client

    #Install Blanket in Flatpak
    flatpak install --user https://flathub.org/repo/appstream/com.rafaelmardojai.Blanket.flatpakref

    #Install Sdkman
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"

    #Install Java 11 and 17 Through Sdkman
    sdk install java 11.0.10-open
    sdk install java 17.0.2-open

    #Install Mysql
    sudo apt install mysql-server
    sudo mysql_secure_installation

    #Initialize With OS
    sudo systemctl enable --now mysql.service

    #Pass Firewall
    sudo ufw allow mysql

    #Install Redis
    curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
    sudo apt update
    sudo apt install redis

    #Install Zsh and Set It as Default Shell
    sudo apt install zsh
    chsh -s $(which zsh)