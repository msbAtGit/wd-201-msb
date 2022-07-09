#Problem 1. Given two arrays books and authors, merge them into a single Hash. The keys of the Hash must be the lower-cased firstname of the authors, and must be symbols.

books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
book_auth_map={}

authors.each_with_index{|author,i| 
                #Converting each author name into lower case and using it as key in the book_auth_map
               #Using symbols as a key
                             book_auth_map[author.split(" ")[0].downcase.to_sym]=books[i]
                                         }
puts(book_auth_map.to_s)  
