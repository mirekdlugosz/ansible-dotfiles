if which {{ lua_binary }} > /dev/null 2>&1; then
	eval "$({{ lua_binary }} "{{ zlua_local_path }}/z.lua" --init bash enhanced once fzf)"
fi
