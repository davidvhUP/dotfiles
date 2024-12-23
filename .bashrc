#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

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


# miniconda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# fzf
. /usr/share/fzf/key-bindings.bash
