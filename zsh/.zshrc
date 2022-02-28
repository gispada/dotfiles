setopt +o nomatch
setopt prompt_subst

# Colored prompt
# PS1="%F{77}%n%f@%F{81}%m%f %~ %F{214}%%%f "

# Command aliases
alias ll="ls -l"
alias lla="ls -la"
alias npmlinks="npm ls -g --depth=0 --link=true"
alias sizes="du -sch .* * | sort -hr"

function git_branch() {
  #branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  branch=$(git symbolic-ref HEAD 2> /dev/null | sed "s/refs\/heads\///")
  if [[ $branch == "" ]]; then
    :
  else
    echo '(%F{208}'$branch'%f) '
  fi
}

# theme=$(defaults read -g AppleInterfaceStyle 2> /dev/null)

PROMPT='%n@%m %F{27}%~%f $(git_branch)%% '
