class Input1Reader
  attr_accessor :location, :filename

  def initialize(location)
    @location = location
  end

  def exists?(name)
    @filename = "#{location}/#{name}.html"
    File.file?(filename)
  end

  def pages
    out = []
    table_rows.each_with_index do |tr, idx|
      next if idx == 0
      out << tr.at_css('td').at_css('a').attr('href')
    end
    out
  end

  private

  def table_rows
    doc = File.open(filename) { |f| Nokogiri::HTML(f) }
    table = doc.at_css('table.default-tbl')
    table.css('tr')
  end
end

