#! /bin/bash

IS_ZSH_NOT_EXIST=`command -v zsh`;

IS_NEOFETCH_NOT_EXIST=`command -v neofetch`;

if [ -z $IS_ZSH_NOT_EXIST ]
then
	echo "ZSH not found! Please install ZSH!"
	exit;
fi


if [ -z $IS_NEOFETCH_NOT_EXIST ]
then
	echo "NEOFETCH not found! Please install ZSH!"
	exit;
fi

echo "Enter your picture source: ";
read PIC_SOURCE;

echo "clear && neofetch --kitty --source " $PIC_SOURCE >> $HOME/.zshrc;

sleep 2;

echo "Successful!";









