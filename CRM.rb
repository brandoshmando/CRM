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
  print_main_menu
  selection = gets.chomp.to_i
  call_option(selection)  
end

main_menu

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