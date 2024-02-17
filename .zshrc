# Zsh Config
unsetopt BEEP
# zmodload zsh/zprof

# Env Var Config
export PYTHONSTARTUP="$HOME/.config/python/pythonrc"
export MANPAGER="sh -c 'col -b | bat -l man -p'"

export HIST_DIR="$HOME/.local/history"
export NODE_REPL_HISTORY="$HIST_DIR/node_history" # Node REPL Hisory
export LESSHISTFILE="$HIST_DIR/less_history"      # Less History
HISTFILE="$HIST_DIR/zsh_history"                  # Zsh History File

# Load zsh scripts
if [ -d "$SCRIPT_PATH" ]; then
    for script_file in "$SCRIPT_PATH"/*; do
        source "$script_file"
    done
fi

eval "$(mise activate zsh)" # mise init
eval "$(starship init zsh)" # starship init

# Load zsh Plugins
source "$PLUGIN_PATH/fzf-tab/fzf-tab.plugin.zsh"                          # zsh-tab init
source "$PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # zsh-syntax-highlighting init
source "$PLUGIN_PATH/zsh-completions/zsh-completions.plugin.zsh"          # zsh-completions init

# Reload completion engine
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

eval "$(zoxide init --cmd cd zsh)"     # zoxide init
