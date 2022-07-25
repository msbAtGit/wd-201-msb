require "date"

class Todo
  # ..
  # ..
  # FILL YOUR CODE HERE
  # ..
  # ..
  def initialize(text, due_date, completed)
    @text = text
    @due_date = due_date
    @completed =completed
    @overdue = !completed
  end
  def to_displayable_string
    completed_str = ""
    if (completed)
      completed_str = "[X]"
    else
      completed_str = "[]"
    end

    if (@due_date == Date.today)
      display_str = "#{completed_str} #{@text}"
    else
      display_str = "#{completed_str} #{@text} #{@due_date}"
    end
    return display_str
  end
  def due_date
    @due_date
  end

  def completed
    @completed
  end

  def completed=(completed)
    @completed=completed
  end

  def overdue?
    if (completed)
     return true
    else
     return false
    end
   end
end

class TodosList
  def initialize(todos)
    @todos = todos
  end

  def overdue
    TodosList.new(@todos.filter { |todo| todo.overdue? })
  end
  def add(todo)
    @todos.push(todo)
  end

  def due_today
    TodosList.new(@todos.filter{|todo| todo.due_date == Date.today})
  end

  def due_later
    TodosList.new(@todos.filter{|todo| todo.due_date > Date.today})
  end

  def to_displayable_list
    list_str = ""
    @todos.each{|todo| list_str = list_str + todo.to_displayable_string + "\n" }
    return list_str
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Service vehicle", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
