class CRM
attr_reader :name
	def initialize(name)
		@name = name
	end

	def print_main_menu
		puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Delete a contact"
	  puts "[4] Display all the contacts"
	  puts "[5] Display an attribute"
	  puts "[6] Exit"
	  puts "Enter a number: "
	end

	def main_menu
		puts "Welcome to the #{name}"
	  print_main_menu
	  selection = gets.chomp.to_i
	  call_option(selection)  
	end

	def call_option(selection)
		case selection
		when 1 then add_new_contact 	
		when 2 then modify_contact
		when 3 then delete_contact
		when 4 then display_all
		when 5 then display_attribute
		when 6 
			puts "Goodbye!"
			return
		else
			puts "Invalid input"
			main_menu
		end
	end
end
crm = CRM.new("Roladex 3000")
crm.main_menu

class Contact
	attr_accessor :id, :first_name, :last_name, :email, :notes
	
	def inititialize(id, first_name, last_name, email, notes)
		@id = 1
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = []
	end

	def add_contact
	end
end

class Roladex
end