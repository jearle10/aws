#!/usr/bin/env bash

echo "Installing scripts to $HOME/.aws-scripts"


create_install_dir() {
    
    INSTALL_DIR=$1

    if [ ! -d $1 ]; then
        echo "Creating $INSTALL_DIR"
        mkdir "$INSTALL_DIR"
    fi
}


install () {

    create_install_dir "$HOME/.aws-scripts"

    # Remove old version if exists already
    if [ -d "$HOME/.aws-scripts/aws" ]; then
        rm -rf "$HOME/.aws-scripts/aws"
    fi

    # Download the latest 
    cd "$HOME"/.aws-scripts
    git clone https://github.com/swoodford/aws.git

    # Make all scripts executable
    chmod 755 $HOME/.aws-scripts/aws/*.sh

    # Check shell to updat path in correct location
    case $SHELL in
    *zsh)
        echo "Using zsh"
        echo "PATH=$PATH:$HOME/.aws-scripts/aws" >> $HOME/.zshrc
    ;;
    *bash)
        echo "Using bash"
        echo "PATH=$PATH:$HOME/.aws-scripts/aws" >> $HOME/.bashrc 
    esac
}

install





