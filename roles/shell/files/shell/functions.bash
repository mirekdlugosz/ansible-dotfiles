przepisz_haslo() {
	gpg --quiet --batch --decrypt "$1" |\
		gpg --quiet --batch -r "${2:-Mirosław Zalewski <miniopl@gmail.com>}" -e --armor 
}

kopiuj() {
	#qdbus org.kde.klipper /klipper org.kde.klipper.klipper.setClipboardContents "$(cat "$1")"
	xclip -selection clipboard "$1"
}

