#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

# zoxide
eval "$(zoxide init bash)"

# Aliases
alias git_tree="git log --graph --topo-order --pretty='\''%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N\'' '"
#alias vim=nvim
#alias vim=/usr/bin/nvim
alias oo='z /mnt/d/My\ Drive\ \(Personal\)/Obsidian\ Vault/Programming;nvim .'
alias archive='tar -vczf'
alias fzf='fzf-tmux -p'
alias ollama-kill='sudo systemctl stop ollama'
alias gprotect='sudo -E gpclient connect --default-browser gprotect.up.ac.za'
#alias cd='z'
alias nnn='nnn -de'
alias lsg='ls | grep -i'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lazygit_dotfiles='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# ls colours
export LS_COLORS='ow=1;34:'

# Autostart Tmux
# Adapted from https://unix.stackexchange.com/a/113768/347104
if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
	  # Adapted from https://unix.stackexchange.com/a/176885/347104
	    # Create session 'main' or attach to 'main' if already exists.
	      tmux new-session -A -s main
fi



# exports
export PATH=$PATH:/home/davidvh/config/zazen_dotfiles/bin/
## nnn open files in new pane
export PATH=$PATH:/home/davidvh/Scripts
export EDITOR=ewrap.sh
export HISTSIZE=10000 # Increase history size
export PATH=$PATH:/usr/local/stata
export RANGER_LOAD_DEFAULT_RC=FALSE



# Activate fzf key binds
. /usr/share/fzf/key-bindings.bash

# Run on startup
neofetch

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# miniconda
if [[ -n "$TMUX" ]] then
  export flavor='conda'
  source $HOME/.tmux/plugins/tmux-conda-inherit/conda-inherit.sh
fi
