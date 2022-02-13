if which direnv > /dev/null 2>&1; then
	eval "$(direnv hook bash)"
fi

if [ -n "$TMUX"  ] && [ -n "$DIRENV_DIR"  ]; then
    direnv reload > /dev/null 2>&1
fi
