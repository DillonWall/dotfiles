#!/bin/bash

cd ~
sudo apt-get update
echo "DISCLAIMER: This script is untested and may not work as expected. Use at your own risk."

# Setup zsh and ohmyzsh
sudo apt-get install -y zsh curl wget git gcc make tldr build-essential tmux zip fzf pipx ripgrep rename
sudo snap install dbeaver-ce
echo "note: use pipx instead of pip for installing python packages"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#chsh -s $(which zsh)

# Setup git config
git config --global user.name "Dillon Wall"
git config --global user.email "dillonmwall@msn.com"
git config --global init.defaultBranch main
git config --global core.editor "nvim"
git config --global pull.rebase true
echo "note: may need to install gh cli and run 'gh auth login' to work with certain repos"

# Setup dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare git@github.com:DillonWall/dotfiles.git $HOME/.dotfiles
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout

# Setup kanata
read -p "Press enter to continue after installing kanata.exe on Windows"
mkdir -p /mnt/c/dev/kanata
cp bin/kanata/my-config.kbd /mnt/c/dev/kanata/my-config.kbd

# Setup Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential

# Setup tmux and tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "make sure to run <prefix> + I to install plugins"

# Setup neovim
sudo snap install nvim --classic
mkdir .config
git clone https://github.com/DillonWall/nvim.git .config
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/

# Setup go
echo "need to install go manually"
echo "https://go.dev/doc/install#linux"
echo "something like this should work:"
echo "wget https://go.dev/dl/go1.24.6.linux-amd64.tar.gz"
echo "sudo tar -C /usr/local -xzf go1.24.6.linux-amd64.tar.gz"
read -p "Press enter to continue after installing go"

# Setup nvm
echo "need to install nvm manually"
echo "something like this should work:"
echo "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash"
read -p "Press enter to continue after installing nvm"
nvm install node

# Setup ssh keys
echo "need to setup ssh keys manually"
echo "something like this should work:"
echo "ssh-keygen -t ed25519 -C 'dillon@pantheonlab.ai'"
echo "then add the key to your github account"
echo "there may be something like this also:"
echo "ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts"
read -p "Press enter to continue after setting up ssh keys"

# Setup pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
source ~/.zshrc
pnpm add turbo --global
echo "note: may need to run 'npm install -g eslint' to get eslint working"
npm i -g pnpm yarn


