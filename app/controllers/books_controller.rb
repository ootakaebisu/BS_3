class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_status = current_user.book_statuses.find_by(book_id: @book.id)
  end
end
