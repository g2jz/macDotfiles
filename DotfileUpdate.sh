#! /opt/homebrew/bin/bash

# Update files
sudo cp -r ~/.vim ~/Repos/dotfiles/.vim
sudo cp ~/.fzf.zsh ~/Repos/dotfiles/.fzf.zsh
sudo cp ~/.iterm2_shell_integration.zsh ~/Repos/dotfiles/.iterm2_shell_integration.zsh
sudo cp ~/.p10k.zsh ~/Repos/dotfiles/.p10k.zsh
sudo cp ~/.tmux.conf ~/Repos/dotfiles/.tmux.conf
sudo cp ~/.zsh_plugins.sh ~/Repos/dotfiles/.zsh_plugins.sh
sudo cp ~/.zshrc ~/Repos/dotfiles/.zshrc
sudo cp -r ~/.config/karabiner ~/Repos/dotfiles/.config/karabiner
sudo cp -r ~/.config/neofetch ~/Repos/dotfiles/.config/neofetch
sudo cp -r ~/.config/nvim ~/Repos/dotfiles/.config/nvim
sudo cp -r ~/.config/ranger ~/Repos/dotfiles/.config/ranger

# Git
cd ~/Repos/dotfiles
git add .
git commit -m "Dotfiles Updated"
git push -u origin main
