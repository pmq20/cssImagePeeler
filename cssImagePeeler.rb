#!/usr/bin/env ruby

unless 2==ARGV.count
  puts "Usage:"
  puts "  cssImagePeeler.rb CSS_FILE-NAME BASE_URL"
  exit(1)
end

File.open(ARGV[0]) do |f|
  while(line = f.gets)
    if line =~ /url\(['"](.*)['"]\)/
      now = String.new $1
      if(now=~/^http:\/\//)
        p `curl -O #{now}`
      else
        p `curl -O #{ARGV[1]}#{now}`
     end
    end
  end
end
