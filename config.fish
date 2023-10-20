if status is-interactive
    set -l script_dir (dirname (status --current-file))

    # Environment variables
    export EDITOR=lvim
    export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/
    export PATH="$HOME/.tfenv/bin:$(brew --prefix)/bin:$HOME/.local/bin:$HOME/mac-dotfiles/bin:$HOME/.config/emacs/bin:$(brew --prefix)/opt/grep/libexec/gnubin:$HOME/go/bin:$PATH"
    export KUBE_CONFIG_PATH=~/.kube/config
    export TERM=xterm-256color-italic
    export LDFLAGS="-L/opt/homebrew/opt/capstone/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/capstone/include"

    fish_add_path /opt/homebrew/opt/openjdk/bin

    # Aliases
    git config --global alias.ci commit
    git config --global alias.co checkout
    git config --global alias.dci duet-commit
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    git config --global alias.lola "log --graph --decorate --pretty=oneline --abbrev-commit --all"

    source $script_dir/abbr.fish

    # Plugins and shell configuration
    set plugins git
    eval "$(/opt/homebrew/bin/brew shellenv)"

    eval "$(starship init fish)"

    eval "$(direnv hook fish)"
    . /opt/homebrew/opt/asdf/libexec/asdf.fish

    # Completion-related configuration
    set FPATH "$(brew --prefix)/share/zsh/site-functions:{$FPATH}"
    if test -d (brew --prefix)"/share/fish/completions"
        set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end
    fzf_configure_bindings --directory=\ct --git_log=\cg --processes=\cq

    if test -r $script_dir/local.fish
        source $script_dir/local.fish
    end

    function print_something_fun
        # if [ $(( $RANDOM % 2 )) -eq 0 ]; then quotes-cli q; else curl -H "Accept: text/plain" https://icanhazdadjoke.com/; echo; fi

        echo "

  "
        set VALUE $( random 1 5 )
        switch $VALUE
            case 0
                fortune | cowsay
            case 1
                curl -s 'https://api.truthordarebot.xyz/api/wyr?rating=PG' | jq -r .question | cowsay
                echo
            case 3
                curl -s https://www.cincinato.org/koans/randomkoan_en.php | w3m -dump -T text/html | sed '/\[Another random.*$/d;/ZenKoansDatabase/d;/English/,$d'
            case 4
                curl -s https://www.conversationstarters.com/generator.php | w3m -dump -T text/html | sed '/\[header\]/,/Random Questions/d;/Generate Another/,$d' | cowsay
            case '*'
                curl -s -H "Accept: text/plain" https://icanhazdadjoke.com/ | lolcat
                echo
        end
        echo "

  "
    end

    function ap
        curl -s https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv | tail +2 | ruby -rcsv -e 'CSV.parse(STDIN.read) {|row| puts row.join("\t")}' | fzf -1 -q "$argv" --with-nth 1 --delimiter "\t" --preview 'echo {2} | fold -s -w $(tput cols)' | cut -d"	" -f2
    end

    function fish_user_key_bindings
        fish_vi_key_bindings
        bind -M insert \cs pet-select
    end

    # Usage: ai fetch ip address
    # Requires OPENAI_API_KEY to be set
    function ai
        set text "System is $(uname -o), version $(uname -r). Write a bash command to $argv. Return only the bash command, no other text. Do not describe what it is. I want to copy/paste exactly what you return and run it directly in a terminal."
        set response (curl -s -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $OPENAI_API_KEY" -d '{"prompt": "'"$text"'", "max_tokens": 300, "model": "gpt-3.5-turbo-instruct"}' https://api.openai.com/v1/completions)
        set completion (echo "$response" | tr -d '\n' | jq -r '.choices[0].text')
        echo -z "$completion"
    end

    print_something_fun
end
