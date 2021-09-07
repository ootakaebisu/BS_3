class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_status = current_user.book_statuses.find_by(book_id: @book.id)
    @review = current_user.reviews.find_by(book_id: @book)
    # 「自分以外全員」のレビューの取得
    @reviews = @book.reviews.where.not(user_id: current_user.id)
    @responses = @book.responses
    
  end
end
