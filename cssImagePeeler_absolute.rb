unless 1==ARGV.count
  puts "Usage:"
  puts "  cssImagePeeler.rb CSS_FILE-NAME"
  exit(1)
end

File.open(ARGV[0]) do |f|
  while(line = f.gets)
    if line =~ /url\(['"]*([^('")]+)['"]*\)/
      now = String.new $1
      path="#{now}"
      url = "#{path}"
      p cmd="wget -x #{url}"
      p `#{cmd}`
    end
  end
end
