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

BREWFPATH="$(brew --prefix)/share/zsh/site-functions"
if [[ $FPATH != *"$BREWFPATH"* ]]; then
    export FPATH=$BREWFPATH:$FPATH
fi

LOCALFPATH="$HOME/.local/comp"
if [[ $FPATH != *"$LOCALFPATH"* ]]; then
    export FPATH=$LOCALFPATH:$FPATH
fi
