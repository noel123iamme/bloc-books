require_relative '../models/book'
require "pry"

class BooksController < BlocWorks::Controller
  attr_accessor :book, :books 

  def welcome
    binding.pry   
    @book = Book.first
    render :welcome
  end

  def index
    binding.pry   
    @books = Book.all
    render :index
  end

  def new
    binding.pry   
    render :new 
  end

  def show
    binding.pry   
    id = @env["QUERY_STRING"].split('=')[1].to_i
    @book = Book.find(id)
    render :show
  end

  def edit
    binding.pry   
    id = @env["QUERY_STRING"].split('=')[1].to_i
    @book = Book.find(id)
    render :edit
  end

  def create
    binding.pry   
    request = Rack::Request.new(@env)
    title   = request.params["title"]
    Book.new(title).save
    @book   = Book.last
    if @book.title == title
      redirect_to '/books/show'
    else
      flash[:error] = "Error creating book.  Please try again."
      redirect_to '/books/new'
    end
  end

  def update
    binding.pry   
    request = Rack::Request.new(@env)
    id      = request.params["id"].to_i

    puts request.params

    @book = Book.find(id)
    puts "#{@book.id} - #{@book.title}"
    @book.title = request.params["title"]
    puts "#{@book.id} - #{@book.title}"
    @book.save!

    redirect_to "/books/welcome"
  end

  def destroy
    binding.pry   
    request = Rack::Request.new(@env)
    id      = request.params["id"].to_i

    Book.destroy(id)

    redirect_to "/books/welcome"
  end
end
