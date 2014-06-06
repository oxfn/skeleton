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
### Disable list of aliases
###
aliases-off() {
    if [ $# -lt 2 ]
    then
        return
    fi
    #echo ALIASES \($@\) -\> OFF
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
    #echo ALIASES \($COMMON_ALIASES\) -\> ON
    alias ll='ls -la --color'
    alias df='dfh -h'
    alias du='duhs -hs'
}
common-aliases-off() {
    aliases-off $COMMON_ALIASES
}

###
### Git aliases on
###
git-aliases-on() {
    GIT_ALIASES='a b c co d ds dc dcs l m psh pll r s st stl stp'
    #echo ALIASES \($GIT_ALIASES\) -\> ON
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
    #echo ALIASES \($PASTEBINS_ALIASES\) -\> ON
    alias pb-sprunge='curl -F "sprunge=<-" http://sprunge.us'
    alias pb-ixio='curl -n -F "f:1=<-" http://ix.io'
}    
pastebins-aliases-off() {
    aliases-off $PASTEBINS_ALIASES
}

###
### Apply sections
###
common-aliases-on
git-aliases-on
pastebins-aliases-on
