#! /bin/bash
echo "LINUX CONFIGURE"
echo ; echo


echo "Enter your password: "

read -s USER_PASSWORD

# Install apt package

echo $USER_PASSWORD | sudo -S apt-get install -y neovim;
echo $USER_PASSWORD | sudo -S apt-get install -y ibus;
echo $USER_PASSWORD | sudo -S apt-get install -y  plank;
echo $USER_PASSWORD | sudo -S apt-get install -y warpinator;
echo $USER_PASSWORD | sudo -S apt-get install -y kitty;
echo $USER_PASSWORD | sudo -S apt-get install -y git;

# # # # # # # #

# Install snap

echo $USER_PASSWORD | sudo -S mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup &> /dev/null

echo $USER_PASSWORD | sudo -S apt install snapd;

snap_app=`command -v snap`;

if [ ! -z $snap_app ]
then
    echo $USER_PASSWORD | sudo -S snap install sqlitebrowser;
    echo $USER_PASSWORD | sudo -S snap install node --classic;
    echo $USER_PASSWORD | sudo -S snap install telegram-desktop;
    echo $USER_PASSWORD | sudo -S snap install heroku --classic;
    echo $USER_PASSWORD | sudo -S snap install docker;
    echo $USER_PASSWORD | sudo -S snap install drawio;
else
    echo "Error when installing snap please try again!";
    exit;
fi


# Install Brave

echo $USER_PASSWORD | sudo -S apt install apt-transport-https curl;

echo $USER_PASSWORD | sudo -S curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg;

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|echo $USER_PASSWORD | sudo -S tee /etc/apt/sources.list.d/brave-browser-release.list;

echo $USER_PASSWORD | sudo -S apt update;

echo $USER_PASSWORD | sudo -S apt install brave-browser;

# # # # # # # #


# Install Conky / Conky Manager



echo $USER_PASSWORD | sudo -S apt-get install -y conky-all;

wget http://launchpadlibrarian.net/340091846/realpath_8.26-3ubuntu4_all.deb https://github.com/teejee2008/conky-manager/releases/download/v2.4/conky-manager-v2.4-amd64.deb;

if [ -f "./realpath_8.26-3ubuntu4_all.deb" && -f "./conky-manager-v2.4-amd64.deb" ]
then
    echo $USER_PASSWORD | sudo -S dpkg -i realpath_8.26-3ubuntu4_all.deb;
    echo $USER_PASSWORD | sudo -S dpkg -i conky-manager-v2.4-amd64.deb;

else
    echo "Can not install Conky and Conky Manager!"
fi

# # Install Conky Theme

echo "Installing Conky Theme..."

conky_app=`command -v conky`;

if [ ! -z conky_app ]
then
    git clone https://github.com/closebox73/Leonis.git;
    cd Leonis;

    if [ ! -d  "$HOME/.config/conky" ]
    then
        mkdir $HOME/.config/conky;
    fi

    cp -R ./* $HOME/.config/conky/

    echo "Conky theme has been installed!"

else
    echo "Fail to install Conky Theme!"
fi

# # # # # # # #

cd ..;


# Install MacOS Theme

echo "Installing MacOS theme..."

git clone https://github.com/B00merang-Project/macOS-Dark;

if [ ! -d "$HOME/.themes"]
then
    mkdir $HOME/.themes
fi

cp -R ./macOS-Dark $HOME/.themes/

# # # # # # # #


# Install JetBrains Mono Fonts


FONTS_DIR="~/.local/share/fonts"

echo "Installing Jetbrains Mono Fonts...";

if [ ! -d "$FONT_DIR"]
then
    mkdir $FONT_DIR;
fi

cp -a ./Fonts/. $FONT_DIR;

fc-cache -f -v;

# # # # # # # #













# TODO autostart for plank in ~/.config/autostart



# TODO google chrome : https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# TODO caprine https://objects.githubusercontent.com/github-production-release-asset-2e65be/42574339/2c1b0030-437b-4c6e-8a03-a1219360e920?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220824%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220824T163855Z&X-Amz-Expires=300&X-Amz-Signature=1fe28edcd36168c1f91c42eec088924f68ef6226def9669a3a322b3452737309&X-Amz-SignedHeaders=host&actor_id=79921131&key_id=0&repo_id=42574339&response-content-disposition=attachment%3B%20filename%3DCaprine-2.56.1.AppImage&response-content-type=application%2Foctet-stream

# TODO teamview https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

# TODO balenanEtcher https://github.com/balena-io/etcher/releases/download/v1.7.9/balena-etcher-electron-1.7.9-linux-ia32.zip?d_id=dd2984b8-75c2-4a92-8d60-dbf6be199af8R

# TODO jetbrains toolbox https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-1.25.12627.tar.gz



