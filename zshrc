PROMPT='%B%F{94}%n%b%f@Macintosh [ %F{cyan}%c%f ] $'

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias ll='ls -alG'

# cache del historial.
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

export PATH=$PATH:/Users/jaime/bin

if [ -f "$HOME/.profile" ]; then
	. $HOME/.profile
fi

#plugins
source ~/.antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle heroku
antigen bundle lein
antigen bundle command-not-found
antigen bundle Tarrasch/zsh-bd
#antigen bundle zsh-users/zsh-syntax-highlighting

#Tell Antigen that you'ar done.
antigen apply

# Configurando un directorio personalizado de completaciones.
fpath=($HOME/.local/share/zsh/completions $fpath)

# Activando el sistema de autocopletado.
autoload compinit

# Inicializando todas las completaciones en $fpath y ignorando (-i) todos los archivos y directorios inseguros.
compinit -i

# ~/.zshrc

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ''$branch' '
  fi

}
# Enable substitution in the prompt.
setopt auto_list
setopt auto_menu
setopt always_to_end
setopt prompt_subst
setopt correct_all # autocorrect commands

zstyle ':completion:*' menu select 
zstyle ':completion:*' group-name 
zstyle ":completion:*:descriptions" format "%B%d%b"

# Config for prompt. PS1 synonym.
#prompt='%2/ $(git_branch_name) > '
PROMPT='%B%F{94}%n%b%f@Macintosh [ %F{cyan}%c%f ] %F{red}$(git_branch_name)%f$'

# vi mode
#bindkey -v
#export KEYTIMEOUT=1

# use vim key in tab complete menu:

# editando la linea en vim.
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line


