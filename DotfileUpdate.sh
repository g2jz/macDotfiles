#! /opt/homebrew/bin/bash

# Update files
sudo cp -r ~/.vim ~/Github/dotfiles/.vim
sudo cp ~/.fzf.zsh ~/Github/dotfiles/.fzf.zsh
sudo cp ~/.iterm2_shell_integration.zsh ~/Github/dotfiles/.iterm2_shell_integration.zsh
sudo cp ~/.p10k.zsh ~/Github/dotfiles/.p10k.zsh
sudo cp ~/.tmux.conf ~/Github/dotfiles/.tmux.conf
sudo cp ~/.zsh_plugins.sh ~/Github/dotfiles/.zsh_plugins.sh
sudo cp ~/.zshrc ~/Github/dotfiles/.zshrc
sudo cp -r ~/.config/karabiner ~/Github/dotfiles/.config/karabiner
sudo cp -r ~/.config/neofetch ~/Github/dotfiles/.config/neofetch
sudo cp -r ~/.config/nvim ~/Github/dotfiles/.config/nvim
sudo cp -r ~/.config/ranger ~/Github/dotfiles/.config/ranger

# Git
cd ~/Github/dotfiles
git add .
git commit -m "Dotfiles Updated"
git push -u origin main
