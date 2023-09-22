[[ $- != *i* ]] && return

# Aliases
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
alias magit='emacsclient -t --eval "(magit)"'
alias make='make -j$(nproc)'
alias runjp='LANG=ja_JP.UTF-8'
alias wine64='WINEPREFIX=$HOME/.wine64 wine'
alias wine64cfg='WINEPREFIX=$HOME/.wine64 winecfg'
alias winejp='LANG=ja_JP.UTF-8 wine'
alias yt-mp3='yt-dlp -xf bestaudio --audio-format mp3 --audio-quality 192k'

# Functions
mem () {
    ps huxk-rss | awk '{printf("%5.1fM\t%5d\t%s\n",$6/1024,$2,$11)}'
}

dired () {
    if [[ -n "$1" && -d "$1" ]]; then
        emacsclient -t -a '' --eval "(dired \"$1\")"
    else
        emacsclient -t -a '' --eval "(dired \"$PWD\")"
    fi
}

# Environment Variables
export PATH="$PATH:$HOME/.local/bin"
export DOOMWADDIR="$HOME/Documents/Doom/wads"
export LESS='-R --use-color -Dd+C$Du+W'

# Emacs vterm integration
vterm_printf() {
    printf "\e]%s\e\\" "$1"
}

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    function clear() {
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    }
fi

# Basic prompt for dumb terminals
if [[ "$TERM" == 'dumb' ]]; then
    unset PROMPT_COMMAND
    PS1='\n\u@\h \w $ '
fi
