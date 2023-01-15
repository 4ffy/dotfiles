[[ $- != *i* ]] && return

# Aliases
alias ip='ip -color=auto'
alias ls='ls --color=auto --group-directories-first'
alias la='ls --color=auto --group-directories-first -a'
alias ll='ls --color=auto --group-directories-first -hl'
alias lla='ls --color=auto --group-directories-first -ahl'
alias cls='clear'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias runjp='LANG=ja_JP.UTF-8'
alias winejp='LANG=ja_JP.UTF-8 wine'
alias wine64='WINEPREFIX=$HOME/.wine64 wine'
alias yt-mp3='yt-dlp -xf bestaudio --audio-format mp3 --audio-quality 192k'
alias fixdisplay='xrandr --output DisplayPort-0 --mode 1920x1080 --rate 240'
alias clearworkspace='find . -type d -name "[Ww]orkspace" -exec rm -r "{}" \;'

# Functions
mem () {
    ps huxk-rss | awk '{printf("%5.1fM\t%5d\t%s\n",$6/1024,$2,$11)}'
}

dired() {
    if [[ -n "$1" && -d "$1" ]]; then
        emacsclient -t -a '' --eval "(dired \"$1\")"
    else
        emacsclient -t -a '' --eval "(dired \"$PWD\")"
    fi
}

fixaudio () {
    systemctl --user restart pipewire.service
    sleep 1
    systemctl --user restart pipewire-pulse.service
    sleep 1
    systemctl --user restart wireplumber.service
}

cmake-build () {
    if [[ -f CMakeLists.txt ]]; then
        cmake -B build && make -C build -j 5 -k
    else
        echo "CMakeLists.txt not found."
        return 1
    fi
}

# Environment Variables
PATH="$PATH:$HOME/.local/bin"
export LESS='-R --use-color -Dd+C$Du+W'
export EDITOR='vi'
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"

# Emacs vterm integration
vterm_printf() {
        printf "\e]%s\e\\" "$1"
}

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    function clear(){
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    }
fi
