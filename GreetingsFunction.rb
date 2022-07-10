def salute(fullName, msg)
  lastName = fullName.split(" ").last.capitalize
  greetingMsg = "#{msg.capitalize} Mr. #{lastName}"
end

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")
