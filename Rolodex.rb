class Rolodex
	attr_accessor :contacts
	def initialize 
		@contacts = []
		@counter = 1000
	end

	def add_contact(contact)
		@contacts << contact
		contact.id = @counter
		@counter += 1 
	end
	def modify_attr
		puts "Enter the ID of the contact you you would like to modify: "
		id = gets.chomp.to_i
		print_attr_options
		puts "Enter the selection of the attribute you would like to modify:"
		selection_index = gets.chomp.to_i
		selection = [:first_name=, :last_name=, :email=, :note=][selection_index]
		puts "Enter the new value: "
		new_value = gets.chomp
		filter
		find_by_id(id).public_send(selection, new_value)
	end
		
	def find_by_id(id)
		@contacts.find { |contact| contact.id == id }
	end

	def all 
		if @contacts.empty? 
			puts "-------------------------------------------"
			puts "Your rolodex is empty. Add a contact first!"
			puts "-------------------------------------------"
		else
			puts "-----------------------"
			@contacts.each do |contact|
				puts "First Name: #{contact.first_name}"
				puts "Last Name: #{contact.last_name}"
				puts "Email Address: #{contact.email}"
				puts "Notes: #{contact.note}"
				puts "ID: #{contact.id}"
				puts "-----------------------"
			end
		end
	end

	def search
		print_attr_options
		puts "Which attribute would you like to search by?"
		selection_index = gets.chomp.to_i
		puts "Please enter the attribute:"
		attribute = gets.chomp
		selection = [:first_name, :last_name, :email, :note][selection_index]
		match = @contacts.find {|contact| selection == attribute }
		puts "-----------------------"
		puts "First Name: #{match.first_name}"
		puts "Last Name: #{match.last_name}"
		puts "Email Address: #{match.email}"
		puts "Notes: #{match.note}"
		puts "ID: #{match.id}"
		puts "-----------------------"
	end

	def remove(id)
		filter
		@contacts.delete(find_by_id(id))
	end	

	def print_attr_options
		puts "[0] First Name:"
		puts "[1] Last Name:"
		puts "[2] Email:"
		puts "[3] Note"
		
	end

	def filter
		puts "Are you sure you would like to perform this action?"
		answer = gets.downcase.chomp
		if answer == "no"
			return
		end
	end
end