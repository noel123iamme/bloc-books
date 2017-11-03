require_relative '../models/library'

class LibrariesController < BlocWorks::Controller
  attr_accessor :library, :libraries 

  def welcome
    @library = Library.first
    render :welcome
  end

  def index
    @libraries = Library.all
    render :index
  end

  def new
    render :new 
  end

  def show
    id = @env["QUERY_STRING"].split('=')[1].to_i
    @library = Library.find(id)
    render :show
  end

  def edit
    id = @env["QUERY_STRING"].split('=')[1].to_i
    @library = Library.find(id)
    render :edit
  end

  def create
    request = Rack::Request.new(@env)
    title = request.params["title"]
    library.new(title).save
    @library = Library.last
    if @library.title == title
      redirect_to '/libraries/show'
    else
      flash[:error] = "Error creating library.  Please try again."
      redirect_to '/libraries/new'
    end
  end

  def update
    request = Rack::Request.new(@env)
    id = request.params["id"].to_i

    @library = Library.find(id)
    @library.title = request.params["title"]
    @library.save

    redirect_to "/libraries/welcome"
  end

  def destroy
    request = Rack::Request.new(@env)
    id = request.params["id"].to_i

    Library.destroy(id)

    redirect_to "/libraries/welcome"
  end
end
