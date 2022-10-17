# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Manual configuration
alias ll='lsd -lha --group-dirs=first'
alias l='lsd --group-dirs=first'
alias ls='lsd --group-dirs=first'

alias cat='bat'
alias catn='/bin/cat'

alias vi='nvim'
alias vin='/usr/bin/vi'

alias nc='netcat'
alias oldnc='/usr/bin/nc'

alias tar='gtar'
alias tarn='/usr/bin/tar'

alias sed='gsed'
alias sedn='/usr/bin/sed'

alias which='gwhich'
alias whichn='/usr/bin/which'

#alias gcc='/opt/homebrew/bin/gcc-11'
#alias gccn='/usr/bin/gcc'

# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}




# Plugins
source ~/.zsh_plugins.sh
source /opt/homebrew/etc/profile.d/z.sh


# Activate vi / vim mode:
bindkey -v

# Remove delay when entering normal mode (vi)
KEYTIMEOUT=5

# Change cursor shape for different vi modes
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
      echo -ne '\e[1 q'
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[$KEYMAP = '' ]] || [[ $1 == 'beam' ]]; then
      echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

# Start with beam shape cursor on zsh startup and after every command
zle-line-init() { zle-keymap-select 'beam' }


# Functions
function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}


function updateRepos(){
  DIR=$PWD
  cd /Users/g2jz/Github/
  ls | while read -r line
       do cd $line 
         git pull
         cd ..
       done
  cd $DIR
}


function statusRepos(){
  DIR=$PWD
  cd /Users/g2jz/Github/
  ls | while read -r line 
       do 
         cd $line 
         git status 
         cd ..
       done
  cd $DIR
}

# User rbenv
eval "$(rbenv init - zsh)"

# PATH
export PATH=/Users/g2jz/.gem/ruby/3.1.0/bin:/Users/g2jz/.rbenv/versions/3.1.2/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/Caskroom/miniforge/base/bin:/opt/homebrew/Caskroom/miniforge/base/condabin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/fzf/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Applications/Wireshark.app/Contents/MacOS



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

