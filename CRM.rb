class CRM
	require_relative 'Contact.rb'
	require_relative 'Rolodex.rb'
	attr_reader :name
	
	def self.run(name)
		crm = new(name)
		crm.main_menu
	end

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
		@rolodex.add_contact(Contact.new("Brandon", "Craft", "brancraft@gmail.com", "note"))
		@rolodex.add_contact(Contact.new("Tester", "McGee", "tester@mcgee.com", "Tester is a cool guy."))
		@rolodex.add_contact(Contact.new("Rob", "Ford", "lovescrack77@shaw.ca", "He crraaazy!"))
		puts "Welcome to #{name}"
	end

	def main_menu
		print_menu	
		selection = gets.chomp.to_i
		option_call(selection)
	end

	def print_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display contact"
		puts "[5] Display contact attribute"
		puts "[6] Delete contact"
		puts "[7] Exit"
		puts "Enter your selection:"
	end

	def option_call(selection)
		case selection
		when 1 then add_a_contact
		when 2 then modify_contact
		when 3 then display_all
		when 4 then display_contact
		when 5 then display_attribute
		when 6 then delete
		when 7
			puts "--Goodbye--"
			return
		else
			puts "--Invalid entry--"
			puts
			main_menu
		end
	end

	def add_a_contact
		puts "Enter the first name: "
		first_name = gets.chomp

		puts "Enter the last name: "
		last_name = gets.chomp

		puts "Enter the email address: "
		email = gets.chomp

		puts "Enter a note about this person: "
		note = gets.chomp

		@rolodex.add_contact(Contact.new(first_name, last_name, email, note))
		main_menu
	end

	def modify_contact
		puts "Enter the ID of the contact you you would like to modify: "
		attr_id = gets.chomp.to_i
		print_attr_options
		puts "Enter the selection of the attribute you would like to modify:"
		selection_index = gets.chomp.to_i
		puts "Enter the new value: "
		new_value = gets.chomp
		@rolodex.modify_attr(selection_index, new_value, attr_id)
		main_menu		 
	end

	def display_all
		@rolodex.all
		main_menu	
	end

	def display_contact
		@rolodex.find_by_attribute
		main_menu
	end

	def delete
		puts "Please enter the ID of the contact you would like to delete:"
		id = gets.chomp.to_i
		@rolodex.remove(id)
		main_menu
	end	

	def print_attr_options
		puts "[1] First Name:"
		puts "[2] Last Name:"
		puts "[3] Email:"
		puts "[4] Note"
	end
end
 
CRM.run("Roladex 3000")
