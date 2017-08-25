
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# load all shell files
for file in "$BASH_DIR"/*; do
[[ -x $file ]] && source "$file"
done

export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Must be last line
[[ $TERM != "screen" ]] && exec screen -q
