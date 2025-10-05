. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias typora="open -a Typora"
alias newbash='/opt/homebrew/bin/bash'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
