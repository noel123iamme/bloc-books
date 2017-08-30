require_relative '../models/library'

class LibraryController < BlocWorks::Controller
	def initialize(env)
		@env = env
		@library = Library.new
	end

	def welcome
		render :welcome, library: @library.first
	end

  def index
    render :index, libraries: @library.all
  end

  def new
    render :new, library: @library.new 
  end

  def show
  	id = @env["QUERY_STRING"].split('=')[1].to_i
    render :show, library: @library.find(id) 
  end

  def edit
  	id = @env["QUERY_STRING"].split('=')[1].to_i
    render :edit, library: @library = @library.find(id)
  end

  # def create
  #   @library = Library.new(library_params)
  #   if @library.save
  #     redirect_to @library, notice: "library was saved successfully."
  #   else
  #     flash[:error] = "Error creating Library.  Please try again."
  #     render :new
  #   end
  # end

  # def update
  #   @library = Library.find(params[:id])
  #   if @library.update_attributes(library_params)
  #     redirect_to @library
  #   else
  #     flash[:error] = "Error saving Library.  Please try again."
  #     render :edit
  #   end
  # end

  # def destroy
  #   @library = Library.find(params[:id])
  #   if @library.destroy
  #     flash[:notice] = "\"#{@library.name}\" was deleted successfully."
  #     redirect_to library_path
  #   else
  #     flash[:error] = "There was an error deleting the Library."
  #     render :show
  #   end
  # end

  # private

  # def library_params
  #   params.require(:library).permit(:name, :description)
  # end
end
