puts "Why, hello there. What would you like to do?"
puts "--Enter 'Add' to add a contact"
puts "--Enter 'Find' to find a contact within the roladex"
puts "--Enter 'Modify' to modify a contact"
puts "--Enter 'Remove' to remove to remove a contact from the roladex"

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
