if echo "$PATH" |grep -q "/.pyenv/"; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
