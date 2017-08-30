require_relative '../models/book'

class BooksController < BlocWorks::Controller
	def initialize(env)
		@env = env
		# @env.each { |k, v| puts "#{k} #{v}/n" }
	end

	def welcome
		render :welcome, book: Book.first
	end

  def index
    render :index, books: Book.all
  end

  def new
    render :new 
  end

  def show
  	id = @env["QUERY_STRING"].split('=')[1].to_i
    render :show, book: Book.find(id) 
  end

  def edit
  	id = @env["QUERY_STRING"].split('=')[1].to_i
    render :edit, book: Book.find(id)
  end

  def create
    request = Rack::Request.new(@env)
    title = request.params["title"]
    Book.new(title).save
    @book = Book.last
    if @book.title == title
      render :show, book: @book
    else
      flash[:error] = "Error creating book.  Please try again."
      render :new
    end
  end

  def update
    request = Rack::Request.new(@env)
    id = request.params["id"].to_i

    book = Book.find(id)
    book.title = request.params["title"]
    book.save

    render :welcome, book: book
  end

  def destroy
    request = Rack::Request.new(@env)
    id = request.params["id"].to_i

    Book.destroy(id)

    render :welcome, book: Book.first
  end
end
