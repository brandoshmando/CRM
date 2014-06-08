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
		matches = find_by_attribute(search_index, search_term)
		selection = [:first_name=, :last_name=, :email=, :note=][mod_index - 1]
		if matches.empty?
			spacer
			puts "No results found. Press enter to return to Main Menu:"
			gets.chomp
		elsif matches.size == 1
			contact_format(matches)
			filter
			matches[0].public_send(selection, new_value)
		else
			list_format(matches)
			puts "Enter selection of contact you would like to modify:"
			selection = gets.chomp
			matches[selection - 1].public_send(selection, new_value)
		end
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
			contact_array = @contacts.each
			contact_format(contact_array)
			puts "Press enter to return to Main Menu"
		end
		gets.chomp
	end

	def search_display(index, search_term)
		matches = find_by_attribute(index, search_term)
		if matches.empty?
			spacer
			puts "No results found. Press enter to return to Main Menu:"
			gets.chomp
		elsif matches.size == 1
			contact_format(matches)
			puts "Press enter to return to main menu"
			gets.chomp
		else
			list_format(matches)
			puts "Press enter to return to the Main Menu"
			gets.chomp
		end
	end

	def find_by_attribute(index, search_term)
		selection = [:first_name, :last_name, :email, :note, :id][index -1 ]
		result =[]
		@contacts.each {|contact| result << contact if contact.send(selection) == search_term }
		result
	end

	def remove(index, search_term)
		filter
		@contacts.delete(find_by_attribute(index, search_term))
	end	

	def print_all(index)
		attribute = [:first_name, :last_name, :email, :note, :id][index - 1]
		spacer
		@contacts.each {|contact|  puts "| #{contact.send(attribute)} |"}
		spacer
		puts "Press Enter to return to Main Menu"
		gets.chomp
	end

	def print_attr_options
		spacer
		puts "[1] First Name"
		puts "[2] Last Name"
		puts "[3] Email"
		puts "[4] Note"
		spacer
	end

	def filter
		puts "Are you sure you would like to perform this action?"
		answer = gets.downcase.chomp
		if answer != "yes"
			return
		end
	end

	def spacer
		puts "-----------------------"
	end

	def contact_format(contact_array)
		contact_array.each do |contact|
			spacer
				puts "First Name: #{contact.first_name}"
				puts "Last Name: #{contact.last_name}"
				puts "Email Address: #{contact.email}"
				puts "Notes: #{contact.note}"
				puts "ID: #{contact.id}"
			spacer
		end
	end

	def list_format(array)
		array.each_with_index do |match, index|
			spacer
			puts "[#{index + 1}]|First Name: #{match.first_name} | Last Name: #{match.last_name} | Email Address: #{match.email} | Notes: #{match.note} | ID: #{match.id}"
			spacer
		end
	end
end