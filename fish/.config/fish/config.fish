not status is-interactive && return

# Aliases
alias black='black --line-length 80'
alias cls='clear'
alias diff='diff --color=auto'
alias ec='emacsclient -t'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias la='ls --color=auto --group-directories-first -a'
alias ll='ls --color=auto --group-directories-first -hl'
alias lla='ls --color=auto --group-directories-first -ahl'
alias ls='ls --color=auto --group-directories-first'
alias make='make -j$(nproc)'
alias mem='ps huxk-rss | awk \'{printf("%5.1fM\t%5d\t%s\n",$6/1024,$2,$11)}\''
alias runjp='LANG=ja_JP.UTF-8'
alias sc='systemctl'
alias scu='systemctl --user
'
alias winejp='LANG=ja_JP.UTF-8 wine'
alias xo='xdg-open'
alias yt-mp3='yt-dlp -xf bestaudio --audio-format mp3 --audio-quality 192k'

# Environment variables
set -gx PATH "$HOME/.local/bin:$PATH"
set -gx DOOMWADDIR "$HOME/Documents/Doom/wads/all"
set -gx LESS '-R --use-color -Dd+C$Du+w'

# Eat integration
if test -n "$EAT_SHELL_INTEGRATION_DIR"; and test -f $EAT_SHELL_INTEGRATION_DIR/fish
    source $EAT_SHELL_INTEGRATION_DIR/fish
end

# Fzf integration
if command -v fzf >/dev/null 2>&1
    fzf --fish | source
end

# Eat-integrated commands. Note that "$argv" behaves like "$*", and unquoted
# $argv behaves like "$@".

function compile -d "Run M-x compile if in Emacs, otherwise run compilation in terminal emacsclient."
    if set -q argv[1]
        set -f args "$argv"
    else
        set -f args (emacsclient --eval '(print compile-command nil)' | sed 's/^.//;s/.$//')
    end

    if string match -q "*eat*" $INSIDE_EMACS
        _eat_msg compile "$args"
    else
        emacsclient -t --eval "(compile \"$args\")"
    end
end

function dired -d "Run M-x dired if in Emacs, otherwise run dired in terminal emacsclient."
    if set -q argv[1]
        set -f target $argv[1]
    else
        set -f target $PWD
    end

    if test ! -d "$target"
        echo "Not a directory: '$target'" >&2
        return 1
    end

    if string match -q "*eat*" $INSIDE_EMACS
        _eat_msg dired $target
    else
        emacsclient -t --eval "(dired \"$target\")"
    end
end

function eww -d "Run M-x eww if in Emacs, otherwise run eww in terminal emacsclient."
    if string match -q "*eat*" $INSIDE_EMACS
        _eat_msg eww "$argv"
    else
        emacsclient -t --eval "(eww \"$argv\")"
    end
end

function magit -d "Run M-x magit if in emacs, otherwise run magit in terminal emacsclient."
    if set -q argv[1]
        set -f target $argv[1]
    else
        set -f target $PWD
    end

    if not in_git_repo $target
        echo "Not a git repository: '$target'" >&2
        return 1
    end

    if string match -q "*eat*" $INSIDE_EMACS
        _eat_msg magit $target
    else
        emacsclient -t --eval "(magit-status-setup-buffer \"$target\")"
    end
end

function man -d "Run M-x man if in Emacs, otherwise run regular man."
    if string match -q "*eat*" $INSIDE_EMACS
        _eat_msg man "$argv"
    else
        command man $argv
    end
end
