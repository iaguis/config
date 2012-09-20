export EDITOR=vim
LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls -lh $LS_OPTIONS'
alias ..="cd .."
alias ...="cd ../.."
alias cp="cp -ri"
alias rm="rm -i"
alias mv="mv -i"
alias svim="sudo vim"
alias gvim='gvim -geom 84x26'
alias vi="vim"
alias o='xdg-open'
alias up='svn up'
alias ci='svn ci'
alias st='svn st'
alias guile='rlwrap guile'
alias csi='rlwrap csi'
alias mit-scheme='rlwrap mit-scheme'
alias racket='rlwrap racket'
alias mplayer='mplayer-compositing.sh'
alias python='ipython2'

export HISTSIZE=1500
export HISTCONTROL=ignoredups

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    c_reset='\[\e[0m\]'
    c_user='\[\033[1;32m\]'
    c_path='\[\e[0;33m\]'
    c_git_clean='\[\e[0;36m\]'
    c_git_dirty='\[\e[0;35m\]'
else
    c_reset=
    c_user=
    c_path=
    c_git_clean=
    c_git_dirty=
fi
 
# Function to assemble the Git part of our prompt.
git_prompt ()
{
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi
 
    git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
 
    if git diff --quiet 2>/dev/null >&2; then
        git_color="$c_git_clean"
    else
        git_color="$c_git_dirty"
    fi
 
    echo " [$git_color$git_branch${c_reset}]"
}
 
# Thy holy prompt.
PROMPT_COMMAND='PS1="${c_user}\u${c_reset}@${c_user}\h${c_reset}:${c_path}\w${c_reset}$(git_prompt)\$ "'

PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

export PATH="$PATH:/home/iaguis/bin:/usr/sbin:/sbin"
export SVN_EDITOR="vim"

# GTK-Qt-Engine
# export SAL_GTK_USE_PIXMAPPAINT=1

# 256 colors

# set TERM xterm-256color; export TERM

# export MAVEN_OPTS="-Xms256m -Xmx512m -XX:PermSize=64m -XX:MaxPermSize=256m"
