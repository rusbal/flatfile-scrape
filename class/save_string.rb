require 'fileutils'

class SaveString
  attr_accessor :location

  def initialize(location)
    @location = location
  end

  def save(name, content)
    File.open(filepath(name), 'w') { |file| file.write(content) }
  end

  def exists?(name)
    File.file?(filepath(name))
  end

  def touch(name)
    file = filepath(name)
    FileUtils.touch(file)
    file
  end

  def filepath(name)
    "#{location}/#{name}.html"
  end
end

