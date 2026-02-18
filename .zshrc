# ~/.zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Compinit for zoxide
autoload -Uz compinit
compinit

# ────────────────────────────────────────────────────────────────────────────────
#  PROMPT
# ────────────────────────────────────────────────────────────────────────────────

# Starship prompt (replaces the old PS1)
eval "$(starship init zsh)"


# ────────────────────────────────────────────────────────────────────────────────
#  ALIASES
# ────────────────────────────────────────────────────────────────────────────────

alias git_tree="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N'"
# alias vim=nvim
# alias vim=/usr/bin/nvim
# alias nvim='conda activate; $(which nvim)'
alias oo='z ~/Documents/Obsidian_vault; nvim .'
alias archive='tar -vczf'
alias fzf='fzf-tmux -p'
alias ollama-kill='sudo systemctl stop ollama'
alias gprotect='sudo gpclient --fix-openssl connect gprotect.up.ac.za'
# alias cd='z'           # ← usually not recommended — zoxide already handles this
alias nnn='nnn -de'
alias lsg='ls | grep -i'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lazygit_dotfiles='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias weather='curl wttr.in'

# ls colors
export LS_COLORS='ow=1;34:'

# ────────────────────────────────────────────────────────────────────────────────
#  ENVIRONMENT VARIABLES & PATH
# ────────────────────────────────────────────────────────────────────────────────

export PATH="$PATH:/home/davidvh/config/zazen_dotfiles/bin"
export PATH="$PATH:/home/davidvh/Scripts"
export PATH="$PATH:/usr/local/stata"
export PATH="$PATH:/home/davidvh/.local/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"

export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

export HISTSIZE=10000
export SAVEHIST=10000           # zsh has separate SAVEHIST
export HISTFILE=~/.zsh_history

export RANGER_LOAD_DEFAULT_RC=FALSE
export BROWSER=waterfox
export OLLAMA_API_BASE='http://127.0.0.1:11434'
export TERM='xterm-256color'    # better default for most modern terminals

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# ────────────────────────────────────────────────────────────────────────────────
#  TMUX AUTO-START
# ────────────────────────────────────────────────────────────────────────────────

if [[ -n "$PS1" && -z "$TMUX" ]]; then
    tmux new-session -A -s main
fi

# ────────────────────────────────────────────────────────────────────────────────
#  STARTUP COMMANDS
# ────────────────────────────────────────────────────────────────────────────────

if [[ -n "$PS1" && -z "$TMUX" ]]; then
    # neofetch
    # Start Ollama in background
    OLLAMA_CONTEXT_LENGTH=8192 ollama serve > /dev/null 2>&1 &
fi

# Autostart Hyprland (only on tty1 and no Wayland/X11 session yet)
if [[ -z "$WAYLAND_DISPLAY" && "$XDG_VTNR" = 1 ]]; then
    exec Hyprland
fi

# ────────────────────────────────────────────────────────────────────────────────
#  FZF & KEY BINDINGS
# ────────────────────────────────────────────────────────────────────────────────

[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ]   && source /usr/share/fzf/completion.zsh

# or if you have ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ────────────────────────────────────────────────────────────────────────────────
#  THE FUCK (corrected command suggestion)
# ────────────────────────────────────────────────────────────────────────────────

eval "$(thefuck --alias)"

# ────────────────────────────────────────────────────────────────────────────────
#  CONDA (uncomment if you still need it)
# ────────────────────────────────────────────────────────────────────────────────
# # >>> conda initialize >>>
# __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# If you still want to activate a venv on startup (not usually recommended)
source ~/base-env/bin/activate

# Optional: nice zsh defaults / quality of life
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# ────────────────────────────────────────────────────────────────────────────────
#  ZSH PLUGINS
# ────────────────────────────────────────────────────────────────────────────────

# Syntax highlighting (must come before autosuggestions)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autosuggestions (ghost text)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Make autosuggestions look nice (adjust color to your taste)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# ────────────────────────────────────────────────────────────────────────────────
#  ZSH KEYBINDINGS
# ────────────────────────────────────────────────────────────────────────────────
bindkey '^F' autosuggest-accept

# edit commands in command-line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
bindkey '^X^e' edit-command-line


# ────────────────────────────────────────────────────────────────────────────────
#  ZOXIDE (better cd / jump)
# ────────────────────────────────────────────────────────────────────────────────

eval "$(zoxide init zsh)"
