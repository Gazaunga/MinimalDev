
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# load all shell files
for file in "$BASH_DIR"/*; do
[[ -x $file ]] && source "$file"
done

# Must be last line
[[ $TERM != "screen" ]] && exec screen -q
