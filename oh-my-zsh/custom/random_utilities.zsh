# Random Utilities
alias all_users="cut -d: -f1 /etc/passwd"
alias boring_terminal="PS1='\u:\W\$ '"
alias folder_size="du -hcs"
alias istheinternetonfire="dig +short -t txt istheinternetonfire.com"
alias recursive_touch="find . -exec touch {} \;"
alias simpleHTTPServer="python3 -m http.server"
alias graphics_card="lspci -k | grep -A 2 -E '(VGA|3D)'"
alias update_rawdog_webpage="cat /home/tyler/.rawdog/output.html | tee /srv/html/rawdog.html"
alias start-ssh-agent='eval "$(ssh-agent -s)"'
alias home_proxy="ssh -N -D 9090 raspberry-pi"
alias grep-recursive="grep -R --exclude-dir='node_modules' --exclude-dir='.git' --exclude-dir='build' --exclude-dir='*cache' "

# nohup -- Make it quiet.
# disown -- Make it not die with when the terminal is closed.
function independent_child () { nohup $@ &> /dev/null & disown }
function independent_zathura () { independent_child zathura $@ }

function pkill--discord () { pkill -f /opt/discord/Discord; pkill -f /opt/discord/Discord}

function do_echo () { echo $@; $@ }
