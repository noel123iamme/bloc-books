class Book
	@@books = [nil]

	attr_accessor :id, :title

	def initialize(title)
		@id = @@books.length
		@title = title
	end

	def self.all
		@@books
	end

	def self.destroy(id)
		@@books[id] = nil
	end

	def self.find(id)
		@@books[id]
	end

	def self.first
		@@books[1]
	end

	def self.last
		@@books.last
	end

	def save
		@@books[@id] = self
	end
end

Book.new("Eloquent Ruby").save
Book.new("Bloc 101 - Coding Bootcamp Redefined").save
Book.new("How to be a Software Engineer").save
