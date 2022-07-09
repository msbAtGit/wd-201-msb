names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
#Joining the sub array with whitesapce to create <FIRSTNAME> SPACE <LASTNAME>
full_names=names.map{|a| a.join(" ")}
puts full_names

