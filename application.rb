class Application

  # attr_accessor

  def initialize()
    ARGV << '--help' if ARGV.empty?
  end

  def new
  end

  def list
  end

  def show
  end

  def find
  end
  
  puts "#{ARGV}"
end

# Here is a list of available commands:
#     new  - Create a new contact
#     list - List all contacts
#     show - Show a contact
#     find - Find a contact