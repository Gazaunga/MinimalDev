# ~/.bashrc
# Created by Paradime

# As usual, if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Make the prompt look badass
export PS1="\[\e[1;90m\]┌─ \[\e[1;94m\]\u\[\e[1;90m\] ── \[\e[1;94m\]\w\[\e[1;90m\] ─\n\[\e[1;90m\]└─▶\[\e[0m\] "

# Possibly a date on startup, I mean if you really want it
#echo `date`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# load all shell files
for file in "$BASH_DIR"/*; do
[[ -x $file ]] && source "$file"
done

export GOPATH=$HOME/.workspace/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

haste() { 
    curl -sd "$(cat $1)" http://hastebin.com/documents | 
    sed -e 's/{"key":"/http:\/\/hastebin.com\//' -e "s/\"}/\.$(echo $1 | 
      sed -e 's/.*\.//')\n/"; 
  }

# Must be last line
[[ $TERM != "screen" ]] && exec screen -q

