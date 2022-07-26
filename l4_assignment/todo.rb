require 'active_record'

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    disp_id = id
    "#{disp_id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map {|todo| todo.to_displayable_string }
  end

  def self.show_list

    puts "overdue\n"
    puts all.where("due_date < ? AND COMPLETED = ?", Date.today,false).to_displayable_list
    puts "\n\n"



    puts "Due Today\n"
    puts all.where(due_date: Date.today).to_displayable_list
    puts "\n\n"

    puts "Due Later\n"
    puts all.where("due_date > ? AND COMPLETED = ?", Date.today,false).to_displayable_list
    puts "\n\n"

  end

  def self.add_task(h)
    new_todo = Todo.create!(todo_text: h[:todo_text], completed: false, due_date: (Date.today+ h[:due_in_days]))
    return new_todo
  end

  def self.mark_as_complete(todo_id)
    todo = Todo.find(todo_id)
    todo.completed=true
    todo.save
    return todo
  end

end
