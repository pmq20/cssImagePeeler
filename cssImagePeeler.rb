unless 2==ARGV.count
  puts "Usage:"
  puts "  cssImagePeeler.rb CSS_FILE-NAME BASE_URL"
  exit(1)
end

File.open(ARGV[0]) do |f|
  while(line = f.gets)
    if line =~ /url\(['"]*([^('")]+)['"]*\)/
      now = String.new $1
heads = ARGV[1].split('://')
heads[1] = heads[1].split('/')[0]
tails = ARGV[1].split('://')[-1].split('/')[1..-1]
after = '/'+tails.join('/')+'/'
      if(now=~/^http:\/\//)
	path="#{now}"
      else
	path="#{after}#{now}"
      end
path=File.expand_path(path)
url = "#{heads[0]}://#{heads[1]}#{path}"
      p cmd="curl -O #{url}"
      p `#{cmd}`
    end
  end
end
