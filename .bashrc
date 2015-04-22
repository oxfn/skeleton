### TODO: 
###     - Configuration section on top of .profile

###
### Find N fresh files in directory recursively
###
findlastmod() {
    if [ "$1" == "" ]
    then
        echo "Usage: findlastmod <path> [count]"
        return
    fi    
    if [ "$2" != "" ]
    then
        N=$2
    else
        N=20
    fi    
    find $1 -type f -exec stat --format '%Y :%y %n' {} \; | sort -nr | cut -d: -f2- | head -n $N
}

###
### Get current git branch
###

###
### Disable list of aliases
###
aliases-off() {
    if [ $# -lt 2 ]
    then
        return
    fi
    for item in $@
    do
        unalias $item
    done
}

###
### Common aliases
###
common-aliases-on() {
    COMMON_ALIASES='ll dfh duhs'
    alias dfh='df -h'
    alias duhs='du -hs'
    alias ll='ls -l --color'
    alias la='ls -a --color'
    alias lla='ls -la --color'
    alias scr='screen -r'
}
common-aliases-off() {
    aliases-off $COMMON_ALIASES
}

###
### Git aliases on
###
git-aliases-on() {
    GIT_ALIASES='a b c co d ds dc dcs l m psh pll r s st stl stp'
    alias a='git add'
    alias b='git branch'
    alias c='git commit'
    alias co='git checkout'
    alias d='git diff'
    alias ds='git diff --stat'
    alias dc='git diff --cached'
    alias dcs='git diff --cached --stat'
    alias l='git log'
    alias lol='git log --oneline'
    alias m='git merge'
    alias psh='git push'
    alias pll='git pull'
    alias r='git reset'
    alias s='git status'
    alias st='git stash'
    alias stl='git stash list'
    alias stp='git stash pop'
}
git-aliases-off() {
    aliases-off $GIT_ALIASES
}

###
### Pastebins aliases
###
pastebins-aliases-on() {
    if [ ! -e /usr/bin/curl ]
    then
        return
    fi
    PASTEBINS_ALIASES='pb-sprunge pb-ixio'
    alias pb-sprunge='curl -F "sprunge=<-" http://sprunge.us'
    alias pb-ixio='curl -n -F "f:1=<-" http://ix.io'
}    
pastebins-aliases-off() {
    aliases-off $PASTEBINS_ALIASES
}

###
### SVN aliases
###
svn-aliases-on() {
    SVN_ALIASES='svn-add-all svn-cleanup-missing'
    alias svnaddall='svn add --force ./'
    alias svncleanup='svn status | grep -e "^\\!" | sed -e "s/^\\!\\s\\+//" | xargs svn rm'
    alias svndiff='svn diff|more'
    alias svnstatus='svn status'
}
svn-aliases-off() {
    aliases-off $SVN_ALIASES
}

###
### Apply sections
###
common-aliases-on
git-aliases-on
pastebins-aliases-on
svn-aliases-on

###
### Configuring git-aware prompt
### Based on https://github.com/jimeh/git-aware-prompt
###
find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ $branch != "" ]]; then
    if [[ "$branch" == "HEAD" ]]; then
      branch='\!detached\!'
    fi
    git_branch=$branch
    git_branch_ps=" "
  else
    git_branch=''
    git_branch_ps=''
  fi
}
find_git_dirty() {
  local status=$(git status --porcelain 2>/dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='*'
  else
    git_dirty=''
  fi
}
set_PS1() {
    find_git_dirty
    find_git_branch
    if [[ $git_branch != "" ]]
    then
        PS1="\[\e[0;32m\u@\h\e[0m\] \e[0;33m\W\e[0m \e[0;36m(\$git_branch)\e[0;31m\$git_dirty\e[0m "
    else
        PS1="\[\e[0;32m\u@\h\e[0m\] \e[0;33m\W\e[0m "
    fi
}
PROMPT_COMMAND="set_PS1; $PROMPT_COMMAND"

# Run local .bashrc
[[ -r ~/.bashrc.local ]] && source ~/.bashrc.local
