#!/bin/bash
# Setup dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare git@github.com:DillonWall/dotfiles.git $HOME/.dotfiles
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout

# Setup Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential

# Setup apps (non exhaustive)
sudo apt-get install -y \
    git \
    zsh \
    curl \
    gnome-tweaks gnome-themes-extra
echo "Feel free to run 'gnome-tweaks' to change themes and other settings"
#chsh -s $(which zsh)
sudo snap install dbeaver-ce


# Setup ohmyzsh?

# Setup tmux and tmux plugins
### TODO: How to install?
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "make sure to run <prefix> + I to install plugins"

