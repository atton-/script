#!/usr/bin/ruby
# Makefile create Script

require 'fileutils'

TemplatesDir = "#{File.dirname(__FILE__)}/templates/makefile"
List = Dir.entries(TemplatesDir).select{|a|File.file?("#{TemplatesDir}/#{a}")}

if ARGV.length != 1
  puts 'please a Make file type'
  puts 'now support type is'
  puts List.join(" ")
  exit
end

unless List.include?(ARGV[0])
  puts "not support '#{ARGV[0]}'"
  puts 'now support type is'
  puts List.join(" ")
  exit
end

FileUtils.copy_file("#{TemplatesDir}/#{ARGV[0]}", "#{Dir.pwd}/Makefile")
