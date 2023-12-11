../tmuxfiles:
	git clone https://github.com/luan/tmuxfiles.git ~/tmuxfiles

/opt/homebrew/bin/brew:
	./scripts/install-homebrew

.PHONY: install-tmux
install-tmux:
	~/tmuxfiles/install


../.zshrc:
	ln -sf ~/mac-dotfiles/zshrc ../.zshrc

../.doom.d:
	ln -sf ~/mac-dotfiles/doom.d ../.doom.d

../.config/fish/config.fish:
	mkdir -p ../.config/fish/
	ln -sf ~/mac-dotfiles/config.fish ../.config/fish/config.fish

../.config/fish/abbr.fish:
	mkdir -p ../.config/fish/
	ln -sf ~/mac-dotfiles/abbr.fish ../.config/fish/abbr.fish

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
	fish -c "fisher install PatrickF1/fzf.fish"
	fish -c "fisher install otms61/fish-pet"

../config/lvim:
	export LV_BRANCH=master
	curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh | bash

.PHONY: brew-bundle
brew-bundle:
	brew bundle

/opt/homebrew/opt/emacs-mac/Emacs.app: brew-bundle
	sudo ln -sf /opt/homebrew/opt/emacs-mac/Emacs.app /Applications

../.rvm:
	\curl -sSL https://get.rvm.io | bash

../.config/emacs:
	git clone https://github.com/doomemacs/doomemacs.git ../.config/emacs

../monaspace:
	git clone https://github.com/githubnext/monaspace.git ../monaspace
	(cd ../monaspace; bash ./util/install_macos.sh)

.PHONY: doom-setup
doom-setup: /opt/homebrew/opt/emacs-mac/Emacs.app ../.config/emacs luansevka
	bash -ic "SHELL='/bin/bash' ../.config/emacs/bin/doom sync"
	bash -ic "SHELL='/bin/bash' ../.config/emacs/bin/doom up"

	npm i -g typescript-language-server
	npm i -g typescript
	npm install -g @georgesg/arc-cli
	npm install -g @graphprotocol/graph-cli

.PHONY: install-go-binaries
install-go-binaries:
	go install github.com/maaslalani/confetty@latest

../.docker/cli-plugins:
	mkdir -p ~/.docker/cli-plugins
	ln -sfn $$(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

../.config/lvim/config.lua: ../.config/lvim
	ln -sf ~/mac-dotfiles/lvim/config.lua ../.config/lvim/config.lua

../.tmux.conf.local:
	ln -sf ~/mac-dotfiles/tmux.conf.local ../.tmux.conf.local

/etc/paths.d/20-homebrew:
	sudo bash -c 'echo "/opt/homebrew/bin:/opt/homebrew/sbin" > /etc/paths.d/20-homebrew'

~/.docker/cli-plugins/docker-buildx:
	ln -sfn $(which docker-buildx) ~/.docker/cli-plugins

~/.talon/user:
	mkdir -p ~/.talon/user/

~/.talon/user/local-config.talon: ~/.talon/user
	ln -sf ~/mac-dotfiles/local-config.talon ~/.talon/user/local-config.talon

~/.talon/user/community: brew-bundle ~/.talon/user
	gh repo clone talonhub/community ~/.talon/user/community || true

~/.talon/user/rango-talon: brew-bundle ~/.talon/user
	gh repo clone david-tejada/rango-talon ~/.talon/user/rango-talon || true

.PHONY: luansevka
luansevka:
	curl -L https://github.com/luan/luansevka/raw/main/fonts/nerd-font/luansevka-slab/Luansevka%20Slab%20Nerd%20Font%20Complete%20Mono.ttf -o ~/Library/Fonts/Luansevka\ Slab\ Nerd\ Font\ Complete\ Mono.ttf

.PHONY: setup

setup: install-terminfo ../.zshrc ../tmuxfiles /opt/homebrew/bin/brew brew-bundle ../.rvm ../.config/emacs ../.docker/cli-plugins ../.config/fish/config.fish install-fisher ../.config/lvim/config.lua ../.tmux.conf.local ../.doom.d eeee/homebrew/opt/emacs-mac/Emacs.app luansevka /etc/paths.d/20-homebrew ~/.docker/cli-plugins/docker-buildx install-go-binaries install-tmux ../.config/fish/abbr.fish ../monaspace ~/.talon/user/local-config.talon ~/.talon/user/rango-talon ~/.talon/user/community

.PHONY: pull
pull:
	git pull

.PHONY: update
update: pull setup
