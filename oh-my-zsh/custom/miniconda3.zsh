#!/bin/zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# I'm a terrible person who likes to play with things I shouldn't.
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export CONDA_AUTO_ACTIVATE_BASE=false
conda deactivate
