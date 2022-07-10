#Problem 2. Given this list of todos, create a Hash keyed by category,
#whose value is an array containing all the todos in that category.
#The keys of the Hash must be a symbol.

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]

todos_map = {}

todos.each do |todo|
  if (todos_map[todo[1].to_sym] == nil)
    todolist_arr = []
    todolist_arr.push(todo[0])
    todos_map[todo[1].to_sym] = todolist_arr
  else
    todos_map[todo[1].to_sym].push(todo[0])
  end
end

puts todos_map.to_s
