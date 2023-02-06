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

../.config/fish/config.fish:
	ln -sf ~/mac-dotfiles/config.fish ../.config/fish/config.fish

.PHONY: install-terminfo
install-terminfo:
	tic -x terminal-italics/tmux-256color.terminfo
	tic -x terminal-italics/xterm-256color-italic.terminfo

.PHONY: install-fisher
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
	fisher install jorgebucaran/fisher
	fisher install patrickf1/fzf.fish

.PHONY: brew-bundle
brew-bundle:
	brew bundle

../.rvm:
	\curl -sSL https://get.rvm.io | bash

../.emacs.d:
	git clone https://github.com/syl20bnr/spacemacs ../.emacs.d

../.docker/cli-plugins:
	mkdir -p ~/.docker/cli-plugins
	ln -sfn $$(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

../.config/lvim/config.lua:
	ln -sf ~/mac-dotfiles/lvim/config.lua ../.config/lvim/config.lua

.PHONY: setup
setup: install-terminfo ../.zshrc ../.spacemacs ../tmuxfiles ../.config/nvim /opt/homebrew/bin/brew brew-bundle ../.rvm ../.emacs.d ../.docker/cli-plugins ../.config/fish/config.fish install-fisher ../.config/lvim/config.lua
