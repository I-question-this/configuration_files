#!/usr/bin/env bash

CONFIG=$HOME/.devilspie/transparency_config.ds

TRANSPARENT=0xdfffffff
OPAQUE=0xffffffff

if [ -f $CONFIG ]; then
  if grep -Fq "$TRANSPARENT" "$CONFIG"; then
    TRANSPARENCY=$OPAQUE
  else
    TRANSPARENCY=$TRANSPARENT
  fi
else
  TRANSPARENCY=$TRANSPARENT
fi

cat > $CONFIG << END
  (begin
    (spawn_async (str "xprop -id " (window_xid) " -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $TRANSPARENCY"))
  )
END

pkill -fx devilspie
devilspie &
