#!/usr/bin/env ruby

dirmerge {
Home=`$HOME`
cp -Rv .!(|.|git) ~/#{Home}
  }

dirmerge

# for bash need?: shopt -s extglob
