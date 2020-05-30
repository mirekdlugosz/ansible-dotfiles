# force reading ~/.profile and ~/.bash_profile, in case they changed
# since last login

for i in "$HOME"/.profile "$HOME"/.bash_profile; do
    if [ -r "$i" ]; then
        . "$i"
    fi
done
unset i
