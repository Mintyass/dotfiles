all : stow alacritty bash tmux zsh


.PHONY : all 


alacritty:
	stow --verbose --restow alacritty

bash:
	stow --verbose --restow bash

tmux:
	stow --verbose --restow tmux


stow:
	stow --verbose --restow stow

.PHONY : zsh
zsh:
	stow --verbose --restow zsh
	ln -s ${HOME}/.themes/dracula.zsh-theme ${ZSH}/themes/dracula.zsh-theme
