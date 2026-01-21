# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias vim='nvim'
alias ll='ls -a'
alias hw='cd ~/dev/omscs/'
alias pr1='docker run -it -v "/home/schen/dev/omscs/CS6200/pr1:/pr1" -w "/pr1" gtomscs6200/spr26-environment:latest'

