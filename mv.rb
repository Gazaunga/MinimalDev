#!/usr/bin/env ruby

dirmerge {
Home=`$HOME`
cp -Rv .!(|.|git) ~/#{Home}
  }

dirmerge
