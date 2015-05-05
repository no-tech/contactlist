## TODO: Implement CSV reading/writing
require 'csv'

class Contact_Database

  def initialize(filename = "contacts.csv")
    @filename = filename
  end

  def read
    @database = CSV.read(@filename)
  end

  def write
    somefile = File.open(@filename, "a")
    somefile.puts "Hello file!"
    somefile.close  
  end
end