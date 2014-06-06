def main_menu
	print_menu	
	selection = gets.chomp
	option_call(selection)
end

def print_menu
	puts "Welcome to Rolodex"
	puts "[1] Add a contact"
	puts "[2] Modify a contact"
	puts "[3] Display all contacts"
	puts "[4] Display contact"
	puts "[5] Display contact attribute"
	puts "[6] Delete contact"
	puts "[7] Exit"
	puts "Enter your selection:"
end

def option_call(selection)
	case selection
	when 1 then add_a_contact
	when 2 then modify_contact
	when 3 then display_all
	when 4 then display_contact
	when 5 then display_attribute
	when 6 then Delete
	when 7
		puts "--Goodbye--"
		return
	else
		puts "Invalid entry"
		main_menu
	end
end