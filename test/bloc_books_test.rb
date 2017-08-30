require "rack/test"
require "test/unit"
# require_relative "../../bloc_works/lib/bloc_works"
require "bloc_works"
require_relative "../config/application"

class BlocBooksTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BlocBooks::Application.new
  end

  def test_books_call
    get "/books/welcome"
    assert last_response.body.include? "Welcome to BlocBooks!"
    assert last_response.ok?
  end

  def test_books_edit
    get "/books/edit?id=1"
    assert last_response.body.include? "Edit Book Record"
    assert last_response.ok?
  end

  def test_books_index
    get "/books/index"
    assert last_response.body.include? "Listing of Books"
    assert last_response.ok?
  end

  def test_books_new
    get "/books/new"
    assert last_response.body.include? "New Book Record"
    assert last_response.ok?
  end

  def test_books_show
    get "/books/show?id=1"
    assert last_response.body.include? "Show Book"
    assert last_response.ok?
  end
end