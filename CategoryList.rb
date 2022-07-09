#Print the list of todos by category. 
#

todos = [
    ["Send invoice", "money"],
    ["Clean room", "organize"],
    ["Pay rent", "money"],
    ["Arrange books", "organize"],
    ["Pay taxes", "money"],
    ["Buy groceries", "food"]
]

#Filtering each array element using the category in the second index

money_arr=todos.select {|item| item[1] == "money" } .map{|item| item[0]}
organize_arr=todos.select {|item| item[1] == "organize" } .map{|item| item[0]}
food_arr=todos.select {|item| item[1] == "food" } .map{|item| item[0]}
#
##Printing each Category
puts("Money:")
money_arr.each{|item| puts("  #{item}\n") }

puts("Organize:")
organize_arr.each{|item| puts("  #{item}\n") }

puts("Food:")
food_arr.each{|item| puts("  #{item}\n") }
