#!/usr/bin/env bash

config=$HOME/.devilspie/transparency_config.ds

transparent=0xdfffffff
opaque=0xffffffff
 
if grep -Fq "$transparent" "$config"; then
  transparency=$opaque
else
  transparency=$transparent
fi

cat > $config << END
  (begin
    (spawn_async (str "xprop -id " (window_xid) " -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY $transparency"))
  )
END

pkill -fx devilspie
devilspie &
