# ANTLR v4
# export CLASSPATH="/usr/local/lib/./antlr-4.5.3-complete.jar:$CLASSPATH"
# alias antlr4='java -jar /usr/local/lib/antlr-4.5.3-complete.jar'
# alias grun='java org.antlr.v4.gui.TestRig'

# C++ Style Guide
alias cpplint="python ~/git/cpp_styleguide/cpplint/cpplint.py"

# Display Settings
export DISPLAY=:0

# G3D
G3D=/home/tyler/G3D9
export PATH=$PATH:$G3D/bin
export CPATH=$CPATH:$G3D/include
export LIBRARY_PATH=$LIBRARY_PATH:$G3D/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$G3D/lib
export G3D9DATA=$G3D/G3D/data
# This works because there is usually only one executable in
# the build folder of a G3D project
alias g3dRun="./build/*"
alias icompileR="icompile;g3dRun"

# Git
alias gitSubmoduleUpdate="git submodule update --remote"
alias gitCommit="git pull; git commit -m "
alias gitMeld="git mergetool -t meld"

# Gocode workspace
export GOPATH=/home/tyler/Code/drive-go-code

# IP address mapping
export HOME_IP=westlandbros.com

# JetBrains
alias clion=/opt/clion/bin/clion.sh
alias intellij=/opt/idea/bin/idea.sh
alias pycharm=/opt/pycharm/bin/pycharm.sh

# JKind
export JKIND=/media/sharedPartition/Apps/JKind/jkind-v2.3
export PATH=$PATH:$JKIND
alias jkind-fork="java -jar /home/tyler/git/UROP/JKind-Fork/build/jkind.jar"

# Minecraft
alias minecraft-client="java -jar /home/tyler/Documents/Minecraft/Minecraft.jar"
 alias technic-client="java -jar /home/tyler/Documents/Minecraft/TechnicLauncher.jar"

# Mink-Ink Tools
alias gauche_defects_surface_categorization="python3 ~/git/Mink-Ink/Gauche_Defects_Surface_Categorization/main.py"
alias ghostScript="python3 ~/git/Mink-Ink/GhostParticles/main.py"
alias video_maker="python3 ~/git/Mink-Ink/Number-volume_Probability_Density/main.py"
alias hacky_fort12_parser="python3 ~/git/Mink-Ink/Hacky_Fort12_Parser/main.py"

# News
alias istheinternetonfire="dig +short -t txt istheinternetonfire.com"

# OCAML
export PATH="$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH"

# OPAM configuration
. /home/tyler/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# SSH computers
# Mona's computers
# Domains and user names
export MAC_MINI_DOMAIN=monaminkara@x162-17.chem.umn.edu
export MAC_PRO_DOMAIN=monaminkara@maxwell5.chem.umn.edu
export IMAC_DOMAIN=monaminkara@x162-16.chem.umn.edu
export MSI_DOMAIN=minka029@login.msi.umn.edu
export SHERLOCK_DOMAIN=mona@x160-55.chem.umn.edu
alias mini="ssh -Y ${MAC_MINI_DOMAIN}"
alias pro="ssh -Y ${MAC_PRO_DOMAIN}"
alias msi="ssh -Y ${MSI_DOMAIN}"
alias imac="ssh -Y ${IMAC_DOMAIN}"
alias sherlock_server="ssh -Y {SHERLOCK_DOMAIN}"

# My computers
alias GitServerSSH="ssh tyler@westlandbros.com"
alias OtherServerSSH="ssh -Y -p 23 tyler@westlandbros.com"
# UMN computers 
alias apollo="ssh -Y westl170@apollo.cselabs.umn.edu"
# Keller 1-250
alias k1250-01="ssh -Y westl170@csel-kh1250-01.cselabs.umn.edu"
alias k1250-02="ssh -Y westl170@csel-kh1250-02.cselabs.umn.edu"
alias k1250-03="ssh -Y westl170@csel-kh1250-03.cselabs.umn.edu"
alias k1250-04="ssh -Y westl170@csel-kh1250-04.cselabs.umn.edu"
alias k1250-05="ssh -Y westl170@csel-kh1250-05.cselabs.umn.edu"
alias k1250-06="ssh -Y westl170@csel-kh1250-06.cselabs.umn.edu"
alias k1250-07="ssh -Y westl170@csel-kh1250-07.cselabs.umn.edu"
alias k1250-08="ssh -Y westl170@csel-kh1250-08.cselabs.umn.edu"
alias k1250-09="ssh -Y westl170@csel-kh1250-09.cselabs.umn.edu"
alias k1250-10="ssh -Y westl170@csel-kh1250-10.cselabs.umn.edu"
alias k1250-11="ssh -Y westl170@csel-kh1250-11.cselabs.umn.edu"
alias k1250-12="ssh -Y westl170@csel-kh1250-12.cselabs.umn.edu"
alias k1250-13="ssh -Y westl170@csel-kh1250-13.cselabs.umn.edu"
alias k1250-14="ssh -Y westl170@csel-kh1250-14.cselabs.umn.edu"
alias k1250-15="ssh -Y westl170@csel-kh1250-15.cselabs.umn.edu"
alias k1250-16="ssh -Y westl170@csel-kh1250-16.cselabs.umn.edu"
alias k1250-17="ssh -Y westl170@csel-kh1250-17.cselabs.umn.edu"
alias k1250-18="ssh -Y westl170@csel-kh1250-18.cselabs.umn.edu"
alias k1250-19="ssh -Y westl170@csel-kh1250-19.cselabs.umn.edu"
alias k1250-20="ssh -Y westl170@csel-kh1250-20.cselabs.umn.edu"
alias k1250-21="ssh -Y westl170@csel-kh1250-21.cselabs.umn.edu"
alias k1250-22="ssh -Y westl170@csel-kh1250-22.cselabs.umn.edu"
alias k1250-23="ssh -Y westl170@csel-kh1250-23.cselabs.umn.edu"
alias k1250-24="ssh -Y westl170@csel-kh1250-24.cselabs.umn.edu"
alias k1250-25="ssh -Y westl170@csel-kh1250-25.cselabs.umn.edu"
alias k1250-26="ssh -Y westl170@csel-kh1250-26.cselabs.umn.edu"
alias k1250-27="ssh -Y westl170@csel-kh1250-27.cselabs.umn.edu"
alias k1250-28="ssh -Y westl170@csel-kh1250-28.cselabs.umn.edu"
alias k1250-29="ssh -Y westl170@csel-kh1250-29.cselabs.umn.edu"
alias k1250-30="ssh -Y westl170@csel-kh1250-30.cselabs.umn.edu"
alias k1250-31="ssh -Y westl170@csel-kh1250-31.cselabs.umn.edu"
alias k1250-32="ssh -Y westl170@csel-kh1250-32.cselabs.umn.edu"
alias k1250-33="ssh -Y westl170@csel-kh1250-33.cselabs.umn.edu"
alias k1250-34="ssh -Y westl170@csel-kh1250-34.cselabs.umn.edu"
alias k1250-35="ssh -Y westl170@csel-kh1250-35.cselabs.umn.edu"
alias k1250-36="ssh -Y westl170@csel-kh1250-36.cselabs.umn.edu"
alias k1250-37="ssh -Y westl170@csel-kh1250-37.cselabs.umn.edu"

# User Management
alias all_users="cut -d: -f1 /etc/passwd"

# X11VNC
alias X11VNC_REAL_DISPLAY="x11vnc -display :0 -localhost -auth guess -noxdamage -rfbauth /home/tyler/.vnc/passwd"

alias X11VNC_CREATE_DISPLAY="x11vnc -create -localhost -auth guess -noxdamage -rfbauth /home/tyler/.vnc/passwd"

alias X11VNC_SUDO_REAL_DISPLAY="sudo x11vnc -display :0 -localhost -auth guess -noxdamage -rfbauth /home/tyler/.vnc/passwd"

alias X11VNC_SUDO_CREATE_DISPLAY="sudo x11vnc -create -localhost -auth guess -noxdamage -rfbauth /home/tyler/.vnc/passwd"

alias Silver_Dexter_X11VNC_Local="ssh tyler@${SILVER_DEXTER_IP} -L 5900:localhost:5900 -t \"x11vnc -create -localhost -auth guess -noxdamage -rfbauth /home/tyler/.vnc/passwd\""


export PYTHONPATH=$PYTHONPATH:~/git/Mink-Ink/AutoPlot-TestSuite/AutoPlot
export PATH=~/git/Mink-Ink/AutoPlot-TestSuite/AutoPlot/:$PATH

# Random Utilities
alias recursive_touch="find . -exec touch {} \;"
alias folder_size="du -hcs"
