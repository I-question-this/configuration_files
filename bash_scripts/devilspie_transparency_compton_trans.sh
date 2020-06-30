#!/usr/bin/env bash
# NOTE: Needs compton to be running

config=$HOME/.devilspie/transparency_config.ds

transparent=85
opaque=100
 
if grep -Fq "$transparent" "$config"; then
  transparency=$opaque
else
  transparency=$transparent
fi

cat > $config << END
  (begin
    (spawn_async (str "picom-trans -w " (window_xid) " $transparency"))
  )
END

pkill -fx devilspie
devilspie &
