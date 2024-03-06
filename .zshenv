export GOPATH="$HOME/go"
export PNPM_HOME="$HOME/Library/pnpm"

export PLUGIN_PATH="$HOME/.local/plugins" 
export SCRIPT_PATH="$HOME/.local/scripts"
export CMAKE_TOOLCHAINS_DIR="$HOME/.local/cmake_toolchains"

export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR="hx" 

SCCACHE="$HOME/.cargo/bin/sccache"
CLANG="/opt/homebrew/opt/llvm/bin/clang"
CLANGXX="/opt/homebrew/opt/llvm/bin/clang++"
export CC="$SCCACHE $CLANG"
export CXX="$SCCACHE $CLANGXX"
