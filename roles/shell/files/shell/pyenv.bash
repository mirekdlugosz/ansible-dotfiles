if echo "$PATH" |grep -q "/.pyenv/"; then
    eval "$(pyenv init - bash --no-rehash)"
fi
