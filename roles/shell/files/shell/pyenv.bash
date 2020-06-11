if echo "$PATH" |grep -q "/.pyenv/" && which pyenv >/dev/null 2>&1; then
    eval "$(pyenv init - bash --no-rehash)"
fi
