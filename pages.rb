require 'open-uri'
require './class/save_string'


resource = "https://tel.local.ch/de/q/Schule,%20%C3%B6ffentliche.html?rid=j5eP&page="

saver = SaveString.new('downloads/1')

page = 1
while true do
  res = resource + page.to_s
  html = open(res)
  content = html.read

  if content =~ /Seite nicht gefunden/
    break
  end

  saver.save(page, content)

  puts "OK: #{page}"
  page += 1
end

puts "Done :-)"

