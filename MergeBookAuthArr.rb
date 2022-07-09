# Given two arrays books and authors, merge them and print who wrote which book.
# author: bharathwaj
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]

#Printing each book with index and getting corresponding author
books.each_with_index{|book, i| puts("#{book} was written by #{authors[i]}")}


