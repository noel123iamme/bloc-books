require_relative '../models/book'
require "pry"

class BooksController < BlocWorks::Controller
  attr_accessor :book, :books 

	def welcome
    @book = Book.first
		render name: "Noel"
	end

  def index
    @books = Book.all
    render 
  end

  def new
    render 
  end

  def show
  	id = params['id'].to_i
    @book = Book.find(id)

    puts "Title: [#{@book.title}]"

    render 
  end

  def edit
  	id = params['id'].to_i
    @book = Book.find(id)
    render 
  end

  def create
    title = params["title"]
    author = params["author"]
    pages = params["pages"].to_i
    Book.create(library_id: 0, title: title, author: author, pages: pages)
    @book = Book.last
    if @book.title == title
      redirect_to "/books/#{@book.id}/show"
    else
      redirect_to "/books"
    end
  end

  def update
    id = params["id"].to_i
    @book = Book.find(id)

    @book.title = params["title"]
    @book.author = params["author"]
    @book.pages = params["pages"].to_i
    @book.save!

    redirect_to "/books/#{@book.id}/show"
  end

  def destroy
    id = params["id"].to_i
    Book.destroy(id)
    redirect_to "/books"
  end
end
