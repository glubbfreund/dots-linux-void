# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
for rc in /etc/bashrc /etc/bash.bashrc; do
  [ -f "$rc" ] && . "$rc"
done

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# source for git promt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

# color some things
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Alias section
alias ..="cd .."
alias ec="emacsclient --tty"
alias ecc="emacsclient -c"
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# No second tab, show instant
bind 'set show-all-if-ambiguous on'
# Case insensitive searching
bind 'set completion-ignore-case on'
# fix the text allready written
bind 'set menu-complete-display-prefix on'
# Use tab to menu complete
bind '"\t": menu-complete'
# shift-tab backwards menu complete
bind '"\e[Z": menu-complete-backward'
# Up and down for history search with context in mind
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Shortcut for change dir
shopt -s autocd
# allows access to all items with **
shopt -s globstar
# enable dir spell help
shopt -s dirspell
# replace vars
shopt -s direxpand

# load git completions prompt modules only if installed
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
fi

# Command prompt formatting function
update_prompt() {
  local EXIT=$?
  local DIR_COLOR="\[\e[90m\]"
  local OK_COLOR="\[\e[37m\]"
  local ERR_COLOR="\[\e[31m\]"
  local RESET="\[\e[0m\]"
  local GIT=""
  local COLOR_GIT="\[\e[38;5;214m\]"

  # git repo string
  local GIT="${COLOR_GIT}$(__git_ps1 '%s ')"

  # check error code and set colors
  if [[ $EXIT -eq 0 ]]; then
    PS1="${DIR_COLOR}\w ${GIT}${OK_COLOR}# ${RESET}"
  else
    PS1="${DIR_COLOR}\w ${GIT}${ERR_COLOR}# ${RESET}"
  fi

  # Space after each prompt section
  echo
}

# run for every prompt
PROMPT_COMMAND=update_prompt

# run fastfetch on startup
fastfetch
