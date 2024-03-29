#!/bin/bash

if echo $* | grep -e "--sudo" -q
then
    #Update and Upgrade
    sudo apt update
    sudo apt upgrade -y
    
    #Install Curl
    sudo apt install apt-transport-https curl -y
    
    #Install Wget
    sudo apt install wget -y
    
    #Install Brave-Browser
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser
    
    #Install VisualStudioCode
    sudo apt install code -y
    
    #Install Insomnia
    sudo apt install insomnia -y
    
    #Install Beekeeper-Studio
    sudo apt install beekeeper-studio -y
    
    #Install Flameshot
    sudo apt install flameshot -y
    
    #Install Diodon
    sudo apt install diodon -y
    
    #Install Piper
    sudo apt install piper -y
    
    #Install Timeshift
    sudo apt install timeshift -y
    
    #Install Evernote
    wget https://cdn1.evernote.com/boron/linux/builds/Evernote-10.7.6-linux-ddl-ga-2321.deb -O evernote.deb
    sudo dpkg ./evernote.deb
    
    #Install and Enable Flatpak Support
    sudo apt install flatpak -y
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
    #Install Spotify in Flatpak
    flatpak install flathub com.spotify.Client -y
    
    #Install Blanket in Flatpak
    flatpak install --user https://flathub.org/repo/appstream/com.rafaelmardojai.Blanket.flatpakref-y
    
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
    sudo apt install zsh -y
    chsh -s $(which zsh)
    
    #Install IntelliJ Idea
    wget https://download.jetbrains.com/idea/ideaIC-2022.1.2.tar.gz -c
    tar -xzf ideaIC-2022.1.2.tar.gz
    cd idea-IC-221.5787.30
    ./configure
    make
    sudo make install
elif echo $* | grep -e "--pacman" -q
then
    #Update
    sudo pacman -Syu
    sudo pacman -Syy

    #Install Yay
    sudo pacman -S yay --noconfirm

    #Install Beekeper
    yay -S beekeeper-studio-appimage --noconfirm

    #Install Optimus-Manager for Dual Gpu
    yay -S optimus-manager --noconfirm
    yay -S optimus-manager-qt --noconfirm

    #Install Zoom
    yay -S zoom --noconfirm

    #Install and Enable Flatpak Support
    sudo apt install flatpak -y
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
    #Install Spotify in Flatpak
    flatpak install flathub com.spotify.Client -y
    
    #Install Blanket in Flatpak
    flatpak install --user https://flathub.org/repo/appstream/com.rafaelmardojai.Blanket.flatpakref-y
    
    #Install Sdkman
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    
    #Install Java 11 and 17 Through Sdkman
    sdk install java 11.0.10-open
    sdk install java 17.0.2-open

    #Install IntelliJ
    yay -S intellij-idea-community-edition --noconfirm

    #Install Brave-Browser
    yay -S brave-browser --noconfirm

    #Install Insomnia
    yay -S insomnia

    #Install Discord
    yay -S discord

    #Install Vscode
    

    #Install Redis
    yay -S redis

    #Install Mysql
    yay -S mysql
else
    echo "no flag"
fi