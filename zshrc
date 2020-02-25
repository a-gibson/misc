# zsh completion
autoload -Uz compinit && compinit

# The prompt will display:
#  - The exit status for the last command (coloured green/red)
#  - The current directory in bold & grey (optimised to ~ for the home directory)
#  - Either % or # at the end depending on root privileges
PROMPT='%(?.%F{green}√.%F{red}X%?)%f %B%F{240}%1~%f%b %# '

# Allow Git branch information to be displayed in the prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# Enable auto-correction of mis-typed commands
setopt CORRECT
setopt CORRECT_ALL

alias ls='ls -G'
alias ll='ls -Gl'
alias la='ls -Gal'

