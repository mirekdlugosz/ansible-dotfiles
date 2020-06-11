# backwards compatibility - export PS1
PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \[\033[01;31m\]]:->\[\033[00m\] '

# starship - https://starship.rs/
if which starship > /dev/null 2>&1 ; then
	eval "$(starship init bash)"
fi
