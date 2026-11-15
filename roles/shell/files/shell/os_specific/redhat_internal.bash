RH_INTERNAL_CONFIG="$HOME/.config/redhat-internal/env.sh"

if [ -f "$RH_INTERNAL_CONFIG" ] ; then
    . "$RH_INTERNAL_CONFIG"
fi
