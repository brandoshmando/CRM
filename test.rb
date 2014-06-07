require_relative 'CRM.rb'
def find_by_attribute
	print_attr_options
	puts "Please enter the selection of the attritbute you would like to search by:"
	attribute_index = gets.chomp.to_i
	selection = [:first_name, :last_name, :email, :note, :id][attritbute]

	puts "Please enter the attribute:"
	search_with = gets.chomp
	@contacts.find {|contact| contact.send(selection) == search_with}
end
