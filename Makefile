../.config/nvim:
	git clone https://github.com/luan/nvim ~/.config/nvim

../tmuxfiles:
	git clone https://github.com/luan/tmuxfiles.git ~/tmuxfiles
	~/tmuxfiles/install

/opt/homebrew/bin/brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

../.zshrc:
	ln -sf ~/mac-dotfiles/zshrc ../.zshrc

../.spacemacs:
	ln -sf ~/mac-dotfiles/spacemacs ../.spacemacs

.PHONY: install-terminfo
install-terminfo:
	tic -x terminal-italics/tmux-256color.terminfo
	tic -x terminal-italics/xterm-256color-italic.terminfo

.PHONY: brew-bundle
brew-bundle:
	brew bundle

../.rvm:
	\curl -sSL https://get.rvm.io | bash

.PHONY: setup
setup: install-terminfo ../.zshrc ../.spacemacs ../tmuxfiles ../.config/nvim /opt/homebrew/bin/brew brew-bundle ../.rvm

