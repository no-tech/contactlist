## TODO: Implement CSV reading/writing
require_relative "contact"
require 'csv'

class ContactDatabase

  attr_reader :data

  def initialize(filename = "contacts.csv")
    @filename = filename
    @data = nil
  end

  def read()
    @data = CSV.read(@filename)
  end

  def write(contact)
    somefile = File.open(@filename, "a")
    somefile.print "\n#{contact.index},#{contact.first_name},#{contact.last_name},#{contact.email}"
    somefile.close  
  end

  def all
    @data.each {|contact| puts contact.join(",")}
  end

  def show(id)
    match = nil
    @data.each {|contact| match = contact if contact[0] == id}
    match.join("\n") unless match.nil?
  end

  def find(string)
    match = nil
    @data.index do |item|
      match = item.join(",") if item.include?(string)
    end
    match
  end

  def unique_email?(email)
    @data.each { |record| return false if record.last == email }
      true
  end
end