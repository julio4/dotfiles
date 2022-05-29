# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
unsetopt autocd beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select # Select menu
zstyle ':completion::complete:*' gain-privileges 1 # Completion for sudo cmd

# End of lines added by compinstall
#
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# Personal Config

# Editor
alias vim=nvim
export EDITOR=nvim
setxkbmap -option caps:escape

# Prompt theme
prompt pure

# Env
export PATH=$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config

# Plugins
# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Alias

# for dotfiles sync
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ls
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias ll='ls --color=auto --human-readable --group-directories-first --classify -l'
alias lla='ls --color=auto --human-readable --group-directories-first --classify -la'

#git
alias gc="git commit"
alias gp="git pull"
alias gf="git fetch"
alias ga="git add"
alias gc="git checkout"
alias gcd="git checkout develop"

# navigation
alias gp="cd ~/projects"

#arch
alias paci="sudo pacman -S"

alias c=clear
# Sync time with nptd
alias synctime="sudo ntpd -qg ; sudo hwclock --systohc && echo 'Success'" 
# launch firefox 30sec ahead of localtime (need firefox closed or add another profile with -P)
alias fakefox="faketime -f '+30s' firefox"
# go to sleep
alias neyoo="shutdown 'now'"

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

