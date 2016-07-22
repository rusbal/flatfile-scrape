require 'nokogiri'
require 'open-uri'
require './class/save_string'
require './class/input_1_reader'

resource = "http://www.suva.ch/"

reader = Input1Reader.new('downloads/1')
saver  = SaveString.new('downloads/2')

input_count = 0
output_count = 0

while true do
  input_count += 1
  unless reader.exists?(input_count)
    break
  end

  puts
  print "Process: #{input_count}: "

  reader.pages.each do |page|
    output_count += 1
    filename = "#{input_count}_#{output_count}"

    next if saver.exists?(filename)

    output_path = saver.touch(filename)
    download = open(resource + page)
    IO.copy_stream(download, output_path)
    
    print "#{output_count}, "
  end

end

puts "Done :-)"

