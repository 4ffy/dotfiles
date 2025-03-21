[[ $- != *i* ]] && return

# Aliases
alias black='black --line-length 80'
alias cls='clear'
alias diff='diff --color=auto'
alias ec='emacsclient -t'
alias fixdisplay='xrandr --output DisplayPort-0 --mode 1920x1080 --rate 240'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias la='ls --color=auto --group-directories-first -a'
alias ll='ls --color=auto --group-directories-first -hl'
alias lla='ls --color=auto --group-directories-first -ahl'
alias ls='ls --color=auto --group-directories-first'
alias make='make -j$(nproc)'
alias runjp='LANG=ja_JP.UTF-8'
alias sc='systemctl'
alias scu='systemctl --user'
alias winejp='LANG=ja_JP.UTF-8 wine'
alias xo='xdg-open'
alias yt-mp3='yt-dlp -xf bestaudio --audio-format mp3 --audio-quality 192k'

# Functions. These should only be suitable for interactive use of Bash.
# Otherwise, it is better to create a proper shell script and put it on $PATH.

compile () {
    args="${*:-$(emacsclient --eval '(print compile-command nil)' \
                 | sed 's/^.//;s/.$//')}"  # strip outer quotes
    if [[ "$INSIDE_EMACS" == *eat* ]]; then
        _eat_msg compile "$args"
    else
        emacsclient -t --eval "(compile \"$args\")"
    fi
}

dired () {
    target=${1:-$PWD}
    if [ ! -d "$target" ]; then
        echo "Not a directory: '$target'" >&2
        return 1
    fi
    if [[ "$INSIDE_EMACS" == *eat* ]]; then
        _eat_msg dired "$target"
    else
        emacsclient -t --eval "(dired \"$target\")"
    fi
}

eww () {
    if [[ "$INSIDE_EMACS" == *eat* ]]; then
        _eat_msg eww "$*"
    else
        emacsclient -t --eval "(eww \"$*\")"
    fi
}

magit () {
    target=${1:-$PWD}
    if [ ! -d "$target/.git" ]; then
        echo "Not a git repository: '$target'" >&2
        return 1
    fi
    if [[ "$INSIDE_EMACS" == *eat* ]]; then
        _eat_msg magit "$target"
    else
        emacsclient -t --eval "(magit-status-setup-buffer \"$target\")"
    fi
}

man () {
    if [[ "$INSIDE_EMACS" == *eat* ]]; then
        _eat_msg man "$*"
    else
        command man "$@"
    fi
}

mem () {
    ps huxk-rss | awk '{printf("%5.1fM\t%5d\t%s\n",$6/1024,$2,$11)}'
}

# Environment Variables
export PATH="$HOME/.local/bin:$PATH"
export DOOMWADDIR="$HOME/Documents/Doom/wads/all"
export LESS='-R --use-color -Dd+C$Du+W'

# Basic prompt for dumb terminals
if [[ "$TERM" == 'dumb' ]]; then
    unset PROMPT_COMMAND
    PS1='\n\u@\h \w $ '
fi

# Eat integration
[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && source "$EAT_SHELL_INTEGRATION_DIR/bash"

# fzf integration
if command -v fzf >/dev/null 2>&1; then
    . <(fzf --bash)
fi
