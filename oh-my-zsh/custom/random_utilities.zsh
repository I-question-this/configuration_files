# Random Utilities
alias all_users="cut -d: -f1 /etc/passwd"
alias boring_terminal="PS1='\u:\W\$ '"
alias folder_size="du -hcs"
alias istheinternetonfire="dig +short -t txt istheinternetonfire.com"
alias recursive_touch="find . -exec touch {} \;"
alias simpleHTTPServer="python2 -m SimpleHTTPServer"
alias graphics_card="lspci -k | grep -A 2 -E '(VGA|3D)'"
alias update_rawdog_webpage="cat /home/tyler/.rawdog/output.html | tee /srv/html/rawdog.html"

# nohup -- Make it quiet.
# disown -- Make it not die with when the terminal is closed.
function independent_child () { nohup $@ &> /dev/null & disown }
function independent_zathura () { independent_child zathura $@ }

function pkill--discord () { pkill -f /opt/discord/Discord; pkill -f /opt/discord/Discord}

function do_echo () { echo $@; $@ }
