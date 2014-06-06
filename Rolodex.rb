class Rolodex
	attr_accessor :contacts
	def initialize 
		@contacts = []
		@counter = 1000
	end

	def add_contact(contact)
		@contacts << contact 
	end

	def find_by_id(id)
		@contacts.find
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
end