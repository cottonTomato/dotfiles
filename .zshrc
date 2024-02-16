# Zsh Settings

# zmodload zsh/zprof
unsetopt BEEP

# Zsh ends

# Common ENV var Config

export PYTHONSTARTUP="$HOME/.config/python/pythonrc"

HIST_DIR="$HOME/.local/history"
export NODE_REPL_HISTORY="$HIST_DIR/.node_history"
export LESSHISTFILE="$HIST_DIR/.less_history"
HISTFILE="$HIST_DIR/.zsh_history" # Zsh History File

export MANPAGER="sh -c 'col -b | bat -l man -p'"

# Common ENV Config End

GOBINPATH="$GOPATH/bin"                          # Source Go
CARGOBINPATH="$HOME/.cargo/bin"                  # Source Rust
PNPMPATH="$PNPM_HOME"                            # Source Pnpm
LLVMBINPATH="$(brew --prefix)/opt/llvm/bin"      # Source llvm
FZFBINPATH="$(brew --prefix)/opt/fzf/bin"        # Source fzf
LOCALBINPATH="$HOME/.local/bin"                  # Source local bins

TOOLPATHS=($GOBINPATH $CARGOBINPATH $LLVMBINPATH $FZFBINPATH $LOCALBINPATH $PNPMPATH)

for toolpath in ${TOOLPATHS[@]}; do
    if [[ $PATH != *"$toolpath"* ]];then
        export PATH=$toolpath:$PATH
    fi
done

export FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
export FPATH="$HOME/.local/comp:$FPATH"

eval "$(mise activate zsh)" # mise init

# Load zsh scripts
if [ -d "$SCRIPT_PATH" ]; then
    for script_file in "$SCRIPT_PATH"/*; do
        source "$script_file"
    done
fi

# Load zsh Plugins
source "$PLUGIN_PATH/fzf-tab/fzf-tab.plugin.zsh"                          # zsh-tab init
source "$PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # zsh-syntax-highlighting init
source "$PLUGIN_PATH/zsh-completions/zsh-completions.plugin.zsh"          # zsh-completions init

eval "$(starship init zsh)" # starship init

# Reload completion engine
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

eval "$(zoxide init --cmd cd zsh)"     # zoxide init
eval "$(_PIO_COMPLETE=zsh_source pio)" # PlatformIO Core completion support
