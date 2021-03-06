##############################################################################
# Paths Configuration
##############################################################################
export PATH='/home/linuxbrew/.linuxbrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH'
export ANTIBODY_HOME=/home/linuxbrew/.linuxbrew/opt/antibody
export SHELL=/home/linuxbrew/.linuxbrew/bin/zsh
##############################################################################
# History Configuration
##############################################################################
HISTSIZE=500               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=500               #Number of history entries to save to disk

setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

##############################################################################
# Compinit lazy loading
##############################################################################
autoload -Uz compinit
compinit -C

##############################################################################
# Alias Configuration
##############################################################################
alias g='git'
alias be='bundle exec'
alias rc='bundle exec rails console'
alias rs='bundle exec rails server'
alias sc='bundle exec spring cucumber'
alias sr='bundle exec spring rspec'
alias rake='bundle exec rake'
##############################################################################
# Sourcing Configuration
##############################################################################
source ~/.zsh_plugins.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /home/linuxbrew/.linuxbrew/opt/asdf/asdf.sh

export RUBY_GC_HEAP_INIT_SLOTS=2000000
export RUBY_HEAP_SLOTS_INCREMENT=500000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=70000000
export RUBY_HEAP_FREE_MIN=100000
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--prompt='∼ ' --pointer='▶' --marker='✓'
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -100'
--bind '?:toggle-preview'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
