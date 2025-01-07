.PHONY: brew-bundle doom-setup install-fisher install-go-binaries install-terminfo install-tmux luansevka pull setup update ~/.talon/user/community ~/.talon/user/talon-ai-tools ~/.talon/user/rango-talon ~/.talon/user/talon-axkit ~/.talon/user/talon-filetree-commands

../.config/emacs:
	git clone https://github.com/doomemacs/doomemacs.git ../.config/emacs

../.config/fish/abbr.fish:
	mkdir -p ../.config/fish/
	ln -sf ~/mac-dotfiles/abbr.fish ../.config/fish/abbr.fish

../.config/fish/config.fish:
	mkdir -p ../.config/fish/
	ln -sf ~/mac-dotfiles/config.fish ../.config/fish/config.fish

../.config/lvim/config.lua: ../.config/lvim
	ln -sf ~/mac-dotfiles/lvim/config.lua ../.config/lvim/config.lua

../.talon/user/community/settings:
	ln -sf ~/mac-dotfiles/talon-settings ../.talon/user/community/settings

../.talon/user/cursorless-settings:
	ln -sf ~/mac-dotfiles/cursorless-settings ../.talon/user/cursorless-settings

../.docker/cli-plugins:
	mkdir -p ~/.docker/cli-plugins
	ln -sfn $$(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

../.doom.d:
	ln -sf ~/mac-dotfiles/doom.d ../.doom.d

../.rvm:
	\curl -sSL https://get.rvm.io | bash

../.tmux.conf.local:
	ln -sf ~/mac-dotfiles/tmux.conf.local ../.tmux.conf.local

../.zshrc:
	ln -sf ~/mac-dotfiles/zshrc ../.zshrc

../.config/lvim:
	export LV_BRANCH='release-1.3/neovim-0.9'
	curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh | bash

../monaspace:
git clone https://github.com/githubnext/monaspace.git ../monaspace
	(cd ../monaspace; bash ./util/install_macos.sh)

../tmuxfiles:
	git clone https://github.com/luan/tmuxfiles.git ~/tmuxfiles

brew-bundle:
	brew bundle

doom-setup: /opt/homebrew/opt/emacs-mac/Emacs.app ../.config/emacs luansevka
	bash -ic "SHELL='/bin/bash' ../.config/emacs/bin/doom sync"
	bash -ic "SHELL='/bin/bash' ../.config/emacs/bin/doom up"
	npm i -g typescript-language-server
	npm i -g typescript
	npm install -g @georgesg/arc-cli
	npm install -g @graphprotocol/graph-cli

install-fisher:
	fish -c "curl -sL https://git.io/fisher | source - && fisher install jorgebucaran/fisher"
	fish -c "fisher install jorgebucaran/fisher"
	fish -c "fisher install patrickf1/fzf.fish"
	fish -c "fisher install jethrokuan/z"
	fish -c "fisher install PatrickF1/fzf.fish"
	fish -c "fisher install otms61/fish-pet"

install-go-binaries:
	go install github.com/maaslalani/confetty@latest

install-terminfo:
	tic -x terminal-italics/tmux-256color.terminfo
	tic -x terminal-italics/xterm-256color-italic.terminfo

install-tmux:
	~/tmuxfiles/install

luansevka:
	curl -L https://github.com/luan/luansevka/raw/main/fonts/nerd-font/luansevka-slab/Luansevka%20Slab%20Nerd%20Font%20Complete%20Mono.ttf -o ~/Library/Fonts/Luansevka\ Slab\ Nerd\ Font\ Complete\ Mono.ttf

pull:
	git pull

update: pull setup

/etc/paths.d/20-homebrew:
	sudo bash -c 'echo "/opt/homebrew/bin:/opt/homebrew/sbin" > /etc/paths.d/20-homebrew'

/opt/homebrew/bin/brew:
	./scripts/install-homebrew

/Applications/Emacs.app: brew-bundle
	sudo ln -sf /opt/homebrew/opt/emacs-mac/Emacs.app /Applications

~/.docker/cli-plugins/docker-buildx:
	ln -sfn $(which docker-buildx) ~/.docker/cli-plugins

~/.talon/user:
	mkdir -p ~/.talon/user/

~/.talon/user/community: ~/.talon/user
	gh repo clone talonhub/community ~/.talon/user/community || (cd ~/.talon/user/community && git pull)

~/.talon/user/rango-talon: ~/.talon/user
	gh repo clone david-tejada/rango-talon ~/.talon/user/rango-talon || (cd ~/.talon/user/rango-talon && git pull)

~/.talon/user/talon-ai-tools: ~/.talon/user
	gh repo clone jaresty/talon-ai-tools ~/.talon/user/talon-ai-tools || (cd ~/.talon/user/talon-ai-tools && git pull)

~/.talon/user/talon-axkit: ~/.talon/user
	gh repo clone phillco/talon-axkit ~/.talon/user/talon-axkit || (cd ~/.talon/user/talon-axkit && git pull)

~/.talon/user/cursorless-talon: ~/.talon/user
	gh repo clone cursorless-dev/cursorless-talon ~/.talon/user/cursorless-talon || (cd ~/.talon/user/cursorless-talon && git pull)

~/.talon/user/clippy-talon: ~/.talon/user
	gh repo clone AndreasArvidsson/clippy-talon ~/.talon/user/clippy-talon || (cd ~/.talon/user/clippy-talon && git pull)

~/.talon/user/talon-filetree-commands: ~/.talon/user
	gh repo clone paul-schaaf/talon-filetree-commands ~/.talon/user/talon-filetree-commands || (cd ~/.talon/user/talon-filetree-commands && git pull)

~/.cache/carapace: brew-bundle
	mkdir ~/.cache/carapace
	carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

setup: install-terminfo ../.zshrc ../tmuxfiles /opt/homebrew/bin/brew brew-bundle ../.rvm ../.config/emacs ../.docker/cli-plugins ../.config/fish/config.fish install-fisher ../.config/lvim/config.lua ../.tmux.conf.local ../.doom.d /opt/homebrew/opt/emacs-mac/Emacs.app luansevka /etc/paths.d/20-homebrew ~/.docker/cli-plugins/docker-buildx install-go-binaries install-tmux ../.config/fish/abbr.fish ../monaspace ~/.talon/user/rango-talon ~/.talon/user/talon-ai-tools ~/.talon/user/community ../.talon/user/community/settings ~/.talon/user/cursorless-talon ../.talon/user/cursorless-settings ~/.talon/user/talon-filetree-commands ~/.talon/user/talon-axkit
