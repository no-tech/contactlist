require_relative 'contact'
require_relative 'contact_database'
require_relative 'application'

my_app = Application.new
puts my_app

db = Contact_Database.new

puts db.read[0]