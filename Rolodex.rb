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
		print_modify_options
		selection_index = gets.chomp.to_i
		selection = [:first_name=, :last_name=, :email=, :note=][selection_index]
		puts "Enter the new value: "
		new_value = gets.chomp
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

	def print_modify_options
		puts "[0] First Name:"
		puts "[1] Last Name:"
		puts "[2] Email:"
		puts "[3] Note"
		puts "Enter the selction of the attribute you would like to modify:"
	end
end