# Personal neovim config

# Installation
```
git clone git@github.com:mustartt/nvim-config.git ~/.config/nvim
cp ~/.config/nvim/tmux.conf ~/.tmux.conf
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim ~/.config/nvim/lua/henry/packer.lua
```

```
:so
:PackerSync
:TSInstall all
```
