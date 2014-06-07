class CRM
	require_relative 'Contact.rb'
	require_relative 'Rolodex.rb'
	attr_reader :name
	
	def self.run(name)
		crm = new(name)
		crm.main_menu
	end

	def initialize(name)
		clear_term
		@name = name
		@rolodex = Rolodex.new
		@rolodex.add_contact(Contact.new("Brandon", "Craft", "brancraft@gmail.com", "note"))
		@rolodex.add_contact(Contact.new("Tester", "McGee", "tester@mcgee.com", "Tester is a cool guy."))
		@rolodex.add_contact(Contact.new("Rob", "Ford", "lovescrack77@shaw.ca", "He crraaazy!"))
		spacer
		puts "Welcome to #{name}"
	end

	def main_menu
		clear_term
		print_menu	
		selection = gets.chomp.to_i
		option_call(selection)
	end

	def print_menu
		clear_term
		spacer
		puts "------ Main Menu ------"
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display contact"
		puts "[5] Display contact attribute"
		puts "[6] Delete contact"
		puts "[7] Exit"
		spacer
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
		clear_term
		spacer
		puts "Enter the first name: "
		first_name = gets.chomp
		spacer
		puts "Enter the last name: "
		last_name = gets.chomp
		spacer
		puts "Enter the email address: "
		email = gets.chomp
		spacer
		puts "Enter a note about this person: "
		note = gets.chomp
		spacer 
		@rolodex.add_contact(Contact.new(first_name, last_name, email, note))
		main_menu
	end

	def modify_contact
		clear_term
		print_attr_options
		puts "Please enter the selection of the attritbute you would like to search by:"
		search_index = gets.chomp.to_i
		spacer
		puts "Please enter the search term:"
		search_term = gets.chomp
		spacer
		print_attr_options
		puts "Enter the selection of the attribute you would like to modify:"
		mod_index = gets.chomp.to_i
		spacer
		puts "Enter the new value: "
		new_value = gets.chomp
		spacer
		@rolodex.modify_attr(search_index, search_term, mod_index, new_value)
		main_menu		 
	end

	def display_all
		clear_term
		@rolodex.all
		main_menu	
	end

	def display_contact
		clear_term
		print_attr_options
		puts "Please enter the selection of the attritbute you would like to search by:"
		index = gets.chomp.to_i

		puts "Please enter the attribute:"
		search_term = gets.chomp
		@rolodex.search_display(index, search_term)
		main_menu
	end

	def delete
		clear_term
		print_attr_options
		puts "Please enter the selection of the attritbute you would like to search by:"
		search_index = gets.chomp.to_i
		spacer
		puts "Please enter the search term:"
		search_term = gets.chomp
		@rolodex.remove(search_index, search_term)
		main_menu
	end	

	def print_attr_options
		clear_term
		spacer
		puts "[1] First Name"
		puts "[2] Last Name"
		puts "[3] Email"
		puts "[4] Note"
		spacer
	end

	def spacer
		puts "-----------------------"
	end

	def clear_term
		puts "\e[H\e[2J"
	end
end
 
CRM.run("Roladex 3000")
