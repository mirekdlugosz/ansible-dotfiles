przepisz_haslo() {
	gpg --quiet --batch --decrypt "$1" |\
		gpg --quiet --batch -r "${2:-Mirosław Zalewski <miniopl@gmail.com>}" -e --armor 
}

kopiuj() {
	#qdbus org.kde.klipper /klipper org.kde.klipper.klipper.setClipboardContents "$(cat "$1")"
	xclip -selection clipboard "$1"
}

pyenv_setup() {
    export PYENV_ROOT="$HOME/.pyenv"
    if [ ! -d "$PYENV_ROOT" ]; then
        git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
    fi
    export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
    eval "$(pyenv init - bash)"
}
