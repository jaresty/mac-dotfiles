../tmuxfiles:
	git clone https://github.com/luan/tmuxfiles.git ~/tmuxfiles
	~/tmuxfiles/install

/opt/homebrew/bin/brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

../.zshrc:
	ln -sf ~/mac-dotfiles/zshrc ../.zshrc

../.doom.d:
	ln -sf ~/mac-dotfiles/doom.d ../.doom.d

../.config/fish/config.fish:
	ln -sf ~/mac-dotfiles/config.fish ../.config/fish/config.fish

.PHONY: install-terminfo
install-terminfo:
	tic -x terminal-italics/tmux-256color.terminfo
	tic -x terminal-italics/xterm-256color-italic.terminfo

.PHONY: install-fisher
install-fisher:
	fish -c "curl -sL https://git.io/fisher | source - && fisher install jorgebucaran/fisher"
	fish -c "fisher install jorgebucaran/fisher"
	fish -c "fisher install patrickf1/fzf.fish"
	fish -c "fisher install jethrokuan/z"

../.config/lvim:
	export LV_BRANCH=master
	curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh | bash

.PHONY: brew-bundle
brew-bundle:
	brew bundle

/opt/homebrew/opt/emacs-mac/Emacs.app: brew-bundle
	ln -sf /opt/homebrew/opt/emacs-mac/Emacs.app /Applications

../.rvm:
	\curl -sSL https://get.rvm.io | bash

../.config/emacs.d:
	git clone https://github.com/doomemacs/doomemacs.git ../.config/emacs.d

.PHONY: doom-setup
doom-setup: /opt/homebrew/opt/emacs-mac/Emacs.app
	../.config/emacs.d/bin/doom sync
	../.config/emacs.d/bin/doom up
	npm i -g typescript-language-server
	npm i -g typescript

../.docker/cli-plugins:
	mkdir -p ~/.docker/cli-plugins
	ln -sfn $$(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

../.config/lvim/config.lua: ../.config/lvim
	ln -sf ~/mac-dotfiles/lvim/config.lua ../.config/lvim/config.lua

../.tmux.conf.local:
	ln -sf ~/mac-dotfiles/tmux.conf.local ../.tmux.conf.local

.PHONY: setup
setup: install-terminfo ../.zshrc ../tmuxfiles /opt/homebrew/bin/brew brew-bundle ../.rvm ../.config/emacs.d ../.docker/cli-plugins ../.config/fish/config.fish install-fisher ../.config/lvim/config.lua ../.tmux.conf.local ../.doom.d /opt/homebrew/opt/emacs-mac/Emacs.app
