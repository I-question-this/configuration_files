#!/usr/bin/env bash
# NOTE: Needs xcompmgr to be running

config=$HOME/.devilspie/transparency_config.ds

transparent=0.85
opaque=1.0
 
if grep -Fq "$transparent" "$config"; then
  transparency=$opaque
else
  transparency=$transparent
fi

cat > $config << END
  (begin
    (spawn_async (str "transset-df -i " (window_xid) " $transparency"))
  )
END

pkill -fx devilspie
devilspie &
