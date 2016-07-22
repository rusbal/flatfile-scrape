require 'csv'
require 'nokogiri'
require './class/scrape_file'

count = 0
scraper = ScrapeFile.new('downloads/2')

CSV.open("output/suva.csv", "w") do |csv|
  Dir.foreach('downloads/2') do |filename|
    next if filename == '.' or filename == '..'
    if count == 0
      csv << scraper.get_header
    end
    csv << scraper.get_data(filename)
    puts "OK: #{filename}"
    count += 1
  end
end

puts "\n-----------------------------------------"
puts 'Done :-)'
puts "Count: #{count}"

