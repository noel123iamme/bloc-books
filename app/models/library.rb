class Library 
	def initialize
		@@library = ["San Francisco Municipal Library", "Benicia City Library", "Golden State Law Library"]
	end

	def all
		@@library
	end

	def find(id)
		@@library[id]
	end

	def first
		@@library.first
	end

	def last
		@@library.last
	end
end
