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
	def modify_attr(search_index, search_term, mod_index, new_value)
		print_attr_options
		selection = [:first_name=, :last_name=, :email=, :note=][mod_index - 1]
		filter
		find_by_attribute(search_index, search_term).public_send(selection, new_value)
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

	def find_by_attribute(index, search_term)
		selection = [:first_name, :last_name, :email, :note, :id][index -1 ]
		@contacts.find {|contact| contact.send(selection) == search_term}

		# puts "-----------------------"
		# puts "First Name: #{match.first_name}" 
		# puts "Last Name: #{match.last_name}"
		# puts "Email Address: #{match.email}"
		# puts "Notes: #{match.note}"
		# puts "ID: #{match.id}"
		# puts "-----------------------"
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
		if answer != "yes"
			return
		end
	end
end