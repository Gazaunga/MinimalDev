#!/usr/bin/env ruby

dirmerge(dir1,dir2) {
`cp -Rv #{ARGV[0]}/* #{ARGV[1]}/`
`cp -Rv #{ARGV[0]}/.* #{ARGV[1]}/`
}
dirmerge
