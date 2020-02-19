# Pywal
if [ -d "$HOME/.cache/wal" ]; then
  (cat $HOME/.cache/wal/sequences &)
  source $HOME/.cache/wal/colors-tty.sh
fi
