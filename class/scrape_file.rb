class ScrapeFile
  attr_accessor :location

  def initialize(location)
    @location = location
  end

  def get_data(file)
    doc = File.open("#{location}/#{file}") { |f| Nokogiri::HTML(f) }
    table = doc.css('table.default-tbl')
    rows = table.css('tr')
    get_values rows
  end

  def get_header
    [
      "anrede",
      "vorname",
      "name",
      "sicherheitsfachleute",
      "sicherheitsingenieure",
      "firmenname",
      "strasse",
      "postfach",
      "plz",
      "ort",
      "land",
      "telefon",
      "fax",
      "email",
      "homepage",
      "sprache",
      "bemerkungen",
      "beratungsauftrage"
    ]
  end

  private

  def get_values(trs)
    [
      trs[1].at_css('td').text,
      trs[2].at_css('td').text,
      trs[3].at_css('td').text,
      trs[4].at_css('td').text,
      trs[5].at_css('td').text,
      trs[6].at_css('td').text,
      trs[7].at_css('td').text,
      trs[8].at_css('td').text,
      trs[9].at_css('td').text,
      trs[10].at_css('td').text,
      trs[11].at_css('td').text,
      trs[12].at_css('td').text,
      trs[13].at_css('td').text,
      trs[14].at_css('td').text,
      trs[15].at_css('td').text,
      trs[16].at_css('td').text,
      trs[17].at_css('td').text,
      trs[18].at_css('td').text
    ]
  end

  def hash_data(trs)
    {
      anrede:                trs[1].at_css('td').text,
      vorname:               trs[2].at_css('td').text,
      name:                  trs[3].at_css('td').text,
      sicherheitsfachleute:  trs[4].at_css('td').text,
      sicherheitsingenieure: trs[5].at_css('td').text,
      firmenname:            trs[6].at_css('td').text,
      strasse:               trs[7].at_css('td').text,
      postfach:              trs[8].at_css('td').text,
      plz:                   trs[9].at_css('td').text,
      ort:                   trs[10].at_css('td').text,
      land:                  trs[11].at_css('td').text,
      telefon:               trs[12].at_css('td').text,
      fax:                   trs[13].at_css('td').text,
      email:                 trs[14].at_css('td').text,
      homepage:              trs[15].at_css('td').text,
      sprache:               trs[16].at_css('td').text,
      bemerkungen:           trs[17].at_css('td').text,
      beratungsauftrage:     trs[18].at_css('td').text
    }
  end
end

