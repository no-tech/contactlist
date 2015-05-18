require_relative "contact_database"

class Contact
 
  attr_reader :first_name, :last_name, :email, :index

  def initialize(index, first_name, last_name, email)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @index = index
  end
 
  def to_s
    "#{index},#{@first_name},#{@last_name},#{@email}"
  end

  class << self
    DB = ContactDatabase.new
    DB.read
    def create(first_name, last_name, email)
      if DB.unique_email?(email)
        DB.write(Contact.new(assign_index, first_name, last_name, email))
      else
        puts "Can't create user, email already exists"
      end
    end
 
    def find(index)
      puts DB.find(index)
    end
 
    def all
      DB.all
    end
    
    def show(id)
      puts DB.show(id) ? "#{DB.show(id)}" : "ID not found"
    end

    def assign_index
        DB.read.last[0].to_i+1
    end
  end
 
end

