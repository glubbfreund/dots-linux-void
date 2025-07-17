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

# history size
export HISTSIZE=10000
export HISTFILESIZE=50000

# other variables
export EDITOR="/usr/bin/emacs -nw"

# Alias section
alias ls='ls --color=auto'
alias grep='grep --color=always'
alias less='less -R'
alias ..="cd .."
alias j="z"
alias ec="emacsclient --tty"
alias ecc="emacsclient -c"
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

# Custom functions
findcontent() { rg --no-heading --line-number --color=always "$@" | fzf --ansi --delimiter : --preview "bat --color=always --highlight-line {2} {1}"; }
findfile() {  fd --type f "$1" . | fzf --ansi --preview 'bat --color=always --style=numbers --line-range=:500 {}'; }

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
if [ -f /usr/share/git/git-prompt.sh ]; then
    source /usr/share/git/git-prompt.sh
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
fi

# Command prompt formatting function
update_prompt() {
  local EXIT=$?
  local DIR_COLOR="\[\e[32m\]"
  local OK_COLOR="\[\e[90m\]"
  local ERR_COLOR="\[\e[31m\]"
  local RESET="\[\e[0m\]"
  local GIT=""
  local COLOR_GIT="\[\e[38;5;214m\]"

  # git repo string
  local GIT="$(__git_ps1 '%s')"
  if [[ ! -z $GIT ]];then
      local GIT="$COLOR_GIT$GIT"
      local GIT="${GIT//[[:space:]]/} "
      local GIT="${GIT//=/}"
  fi

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

# Setup fzf
eval "$(fzf --bash)"
# Setup zoxide
eval "$(zoxide init bash)"
