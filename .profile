# Common functions
findlastmod() {
    if [ "$1" != "" ]
    then
        echo "Usage: $0 <path> [count]"
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

# Git aliases on
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
    alias m='git merge'
    alias psh='git push'
    alias pll='git pull'
    alias r='git reset'
    alias s='git status'
    alias st='git stash'
    alias stl='git stash list'
    alias stp='git stash pop'
}

# Git aliases off
git-aliases-off() {
    for item in $GIT_ALIASES
    do
        echo $item
        unalias $item
    done
}

# Pastebins aliases
pastebins-on() {
    if [ ! -e /usr/bin/curl ]
    then
        return
    fi
    alias pb-sprunge='curl -F "sprunge=<-" http://sprunge.us'
    alias pb-ixio='curl -n -F "f:1=<-" http://ix.io'
}    

#
# Apply sections
#
git-aliases-on
pastebins-on
