#!/bin/bash

### Script to generate current list of installed extensions for vscode

code --list-extensions > ./files/usr/local/etc/code-extensions-list.txt
cp ~/.config/Code/User/settings.json ./files/usr/local/etc/code-settings.json