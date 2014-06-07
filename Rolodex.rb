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
	def modify_attr(index, value, attr_id)
		print_attr_options
		selection_index = index
		new_value = value
		id = attr_id
		selection = [:first_name=, :last_name=, :email=, :note=][selection_index]
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

	def find_by_attribute
		puts "Please enter the selection of the attritbute you would like to search by:"
		attribute_index = gets.chomp.to_i
		selection = [:first_name, :last_name, :email, :note, :id][attribute_index -1 ]

		puts "Please enter the attribute:"
		search_with = gets.chomp
		match = @contacts.find {|contact| contact.send(selection) == search_with}

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
		puts "[1] First Name:"
		puts "[2] Last Name:"
		puts "[3] Email:"
		puts "[4] Note"
	end

	def filter
		puts "Are you sure you would like to perform this action?"
		answer = gets.downcase.chomp
		if answer == "no"
			return
		end
	end
end