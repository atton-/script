#!/usr/bin/ruby
# Makefile create Script

require 'fileutils'

lists = ['pdf']

if ARGV.length != 1
  puts 'please only Make file type'
  puts 'now support type is'
  puts lists.map{|a|"'#{a}'"}.join(" ")
  exit
end

unless lists.include?(ARGV[0])
  puts "not support #{ARGV[0]}"
  puts 'now support type is'
  puts lists.map{|a|"'#{a}'"}.join(" ")
  exit
end

FileUtils.copy_file("#{File.dirname(__FILE__)}/makefile_templates/#{ARGV[0]}",
                    "#{Dir.pwd}/Makefile")
