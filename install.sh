#!/usr/bin/env bash

echo "Installing scripts to $HOME/.aws-scripts"


create_install_dir() {
    
    install_dir=$1

    if [ ! -d $1 ]; then
        echo "Creating $install_dir"
        mkdir "$install_dir"
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
        if ! grep ".aws-scripts/aws" "$HOME/.zshrc"; 
        then 
            echo 'export PATH=$PATH:$HOME/.aws-scripts/aws' >> $HOME/.zshrc
        fi
    ;;
    *bash)
        echo "Using bash"
        if ! grep ".aws-scripts/aws" "$HOME/.bashrc"; 
        then 
            echo 'export PATH=$PATH:$HOME/.aws-scripts/aws' >> $HOME/.bashrc 
        fi
    esac

    # Create aliases for each script 
}

install




