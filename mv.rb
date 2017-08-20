#!/usr/bin/env ruby

Home=system("$HOME")

dirmerge(dir1,dir2) {
`cp -Rv #{ARGV[0]}/* #{ARGV[1]}/`
`cp -Rv #{ARGV[0]}/.* #{ARGV[1]}/`
}
dirmerge MinimalDev $Home
