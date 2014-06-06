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
		id = gets.chomp
		print_modify_options
		object = find_by_id(id)
	end
		
	def find_by_id(id)
		@contacts.find {|contact| contact.id == id}
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
		puts "[1] First Name:"
		puts "[2] Last Name:"
		puts "[3] Email:"
		puts "[4] Note"
		puts "Enter the selction of the attribute you would like to modify:"
	end
end