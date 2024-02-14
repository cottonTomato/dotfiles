# Zsh Settings

zmodload zsh/zprof
unsetopt BEEP

HISTFILE="$HOME/.local/history/.zsh_history"

# Zsh ends

# Common ENV var Config

export NODE_REPL_HISTORY=""
export PYTHONSTARTUP="$HOME/.config/python/pythonrc"
export LESSHISTFILE=-
export MANPAGER="sh -c 'col -b | bat -l man -p'"

# Common ENV Config End

export PATH="$GOPATH/bin:$PATH"      # Source Go
export PATH="$HOME/.cargo/bin:$PATH" # Source Rust
export PATH="$PNPM_HOME:$PATH"       # Source Pnpm

export PATH="$(brew --prefix)/opt/llvm/bin:$PATH"
export PATH="$(brew --prefix)/opt/fzf/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
export FPATH="$HOME/.local/comp:$FPATH"

eval "$(mise activate zsh)"

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
