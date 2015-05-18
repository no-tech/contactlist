require_relative 'contact'

class Application


  attr_accessor :contacts

  def initialize()
    ARGV << 'help' if ARGV.empty?
    @command = ARGV.first
    @arg = ARGV.last unless ARGV.nil? || ARGV.length == 1
    @contacts = []
    self.send @command.to_sym
    # rescue then self.send :help
  end

  def new
    puts "What is the first name?"
    first_name = STDIN.gets.chomp
    puts "What is the last name?"
    last_name = STDIN.gets.chomp
    puts "What is the email?"
    contact_email = STDIN.gets.chomp
    Contact.create(first_name, last_name, contact_email)
  end

  def list
    Contact.all
  end

  def show
    Contact.show(@arg)
  end

  def find
    Contact.find(@arg)
  end

  def help
    puts "Here is a list of available commands:"
    puts "    new  - Create a new contact"
    puts "    list - List all contacts"
    puts "    show - Show a contact"
    puts "    find - Find a contact"
  end

end

app = Application.new
