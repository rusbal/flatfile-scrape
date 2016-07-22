require 'open-uri'
require './class/save_string'


resource = "http://www.suva.ch/startseite-suva/praevention-suva/arbeit-suva/spezialisten-der-arbeitssicherheit-suva.htm?information_4=&information_5=5uVa&industry=&consulting=&country=1&plz=&city=&lastname=&firstname=&submitbutton=Suchen&orderby=lastname&direction=asc&currentPage="

saver = SaveString.new('downloads/1')

page = 1
while true do
  res = resource + page.to_s
  html = open(res)
  content = html.read

  if content =~ /Keine Daten gefunden/
    break
  end

  saver.save(page, content)

  puts "OK: #{page}"
  page += 1
end

puts "Done :-)"

