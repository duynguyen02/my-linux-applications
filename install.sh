#! /bin/bash

start_installer(){
    echo;
    echo "================================================================================================";
    echo $1
    echo "------------------------------------------------------------------------------------------------";
}

end_installer(){
    echo "================================================================================================"
    echo;
    echo;
}




echo "LINUX CONFIGURE"
echo ; echo


echo "Enter your password: "

read -s USER_PASSWORD

# Install apt package

echo $USER_PASSWORD | sudo -S apt update;

echo $USER_PASSWORD | sudo -S apt install -y neovim;
echo $USER_PASSWORD | sudo -S apt install -y ibus;
echo $USER_PASSWORD | sudo -S apt install -y  plank;
echo $USER_PASSWORD | sudo -S apt install -y warpinator;
echo $USER_PASSWORD | sudo -S apt install -y kitty;
echo $USER_PASSWORD | sudo -S apt install -y git;
echo $USER_PASSWORD | sudo -S apt install -y neofetch;
echo $USER_PASSWORD | sudo -S apt-get install -y sqlitebrowser;
echo $USER_PASSWORD | sudo -S apt-get install -y gtk2-engines-murrine gtk2-engines-pixbuf;

# # # # # # # #

# Install snap

start_installer "Installing Snap..."

echo $USER_PASSWORD | sudo -S mv /etc/apt/preferences.d/nosnap.pref $HOME/Documents/nosnap.backup &> /dev/null

echo $USER_PASSWORD | sudo -S apt install snapd;

end_installer

snap_app=`command -v snap`;

if [ ! -z $snap_app ]
then

    start_installer "Installing snap apps..."

    echo "Installing node..."
    echo $USER_PASSWORD | sudo -S snap install node --classic;
    echo "---------------------------"

    echo "Installing telegram-desktop..."
    echo $USER_PASSWORD | sudo -S snap install telegram-desktop;
    echo "---------------------------"

    echo "Installing heroku..."
    echo $USER_PASSWORD | sudo -S snap install heroku --classic;
    echo "---------------------------"

    echo "Installing docker..."
    echo $USER_PASSWORD | sudo -S snap install docker;
    echo "---------------------------"

    echo "Installing drawio..."
    echo $USER_PASSWORD | sudo -S snap install drawio;
    echo "---------------------------"


    end_installer
else
    echo "Error when installing snap please try again!";
fi

sleep 10;

# Install Brave
start_installer "Installing Brave ..."

echo $USER_PASSWORD | sudo -S apt install apt-transport-https curl;

echo $USER_PASSWORD | sudo -S curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg;

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo $USER_PASSWORD | sudo -S apt update;

echo $USER_PASSWORD | sudo -S apt install -y brave-browser;

end_installer
# # # # # # # #

sleep 10;


# Install Conky / Conky Manager

start_installer "Installing Conky..."

echo $USER_PASSWORD | sudo -S apt install -y conky-all;

sleep 10

wget http://launchpadlibrarian.net/340091846/realpath_8.26-3ubuntu4_all.deb https://github.com/teejee2008/conky-manager/releases/download/v2.4/conky-manager-v2.4-amd64.deb;

sleep 10;


echo $USER_PASSWORD | sudo -S apt install -y realpath_8.26-3ubuntu4_all.deb;
echo $USER_PASSWORD | sudo -S apt install -y conky-manager-v2.4-amd64.deb;
# echo $USER_PASSWORD | sudo -S apt install -f;


sleep 10;

# Install Conky Theme

echo "-------------------------"
echo "Installing Conky Theme...";
echo "-------------------------"

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
    echo "-------------------------------"
    echo "Conky theme has been installed!"
    echo "-------------------------------"

else
    echo "-------------------------------"
    echo "Fail to install Conky Theme!"
    echo "-------------------------------"

fi

# # # # # # # #


cd ..;


# Install MacOS Theme

start_installer "Installing MacOS Theme..."

git clone https://github.com/B00merang-Project/macOS-Dark;

if [ ! -d "$HOME/.themes"]
then
    mkdir $HOME/.themes
fi

cp -R ./macOS-Dark $HOME/.themes/

end_installer

# # # # # # # #

sleep 10

echo $USER_PASSWORD | sudo -S apt --fix-broken install

sleep 10




start_installer "Installing Fluent Icon..."

git clone https://github.com/vinceliuice/Fluent-icon-theme;

sleep 10;

cd Fluent-icon-theme;

./install.sh -b;

sleep 10;

cd ..

end_installer



start_installer "Installing Lyan Theme..."

git clone https://github.com/vinceliuice/Layan-gtk-theme;

sleep 10;

cd Layan-gtk-theme;

./install.sh;

sleep 10;

cd ..;

end_installer

start_installer "Installing Vim-Plug"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';

sleep 10;

CURRENT_DIR=`pwd`;

cp $CURRENT_DIR/init.vim $HOME/.config/nvim/init.vim;

echo "Vim-Plug has been installed! Please run Plug-Install command in your NeoVim!"

end_installer


# Add snap icons apps to Menu
echo $USER_PASSWORD | sudo -S cp -R /var/lib/snapd/desktop/applications/* ~/.local/share/applications;
# # # # # # # #

start_installer "Completed!"






# TODO autostart for plank in ~/.config/autostart



# TODO google chrome : https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# TODO caprine https://objects.githubusercontent.com/github-production-release-asset-2e65be/42574339/2c1b0030-437b-4c6e-8a03-a1219360e920?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220824%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220824T163855Z&X-Amz-Expires=300&X-Amz-Signature=1fe28edcd36168c1f91c42eec088924f68ef6226def9669a3a322b3452737309&X-Amz-SignedHeaders=host&actor_id=79921131&key_id=0&repo_id=42574339&response-content-disposition=attachment%3B%20filename%3DCaprine-2.56.1.AppImage&response-content-type=application%2Foctet-stream

# TODO teamview https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

# TODO balenanEtcher https://github.com/balena-io/etcher/releases/download/v1.7.9/balena-etcher-electron-1.7.9-linux-ia32.zip?d_id=dd2984b8-75c2-4a92-8d60-dbf6be199af8R

# TODO jetbrains toolbox https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-1.25.12627.tar.gz



