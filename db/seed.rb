require_relative "../app/models/book"
require_relative "../app/models/library"
require "bloc_record"
 
BlocRecord.connect_to("db.sqlite")

library = Library.create(name: "San Francisco Municipal Library", city: "San Francisco")
Book.create(library_id: library.id, title: "The Well-Grounded Rubyist", author: "David A. Black", pages: 520)
Book.create(library_id: library.id, title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz", pages: 272)
Book.create(library_id: library.id, title: "Eloquent Ruby", author: "Russ Olsen", pages: 448)