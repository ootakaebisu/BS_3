class FavoriteBooksController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite_book = current_user.favorite_books.new(book_id: book.id)
    favorite_book.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite_book = current_user.favorite_books.find_by(book_id: book.id)
    favorite_book.destroy
    redirect_back(fallback_location: root_path)
  end
end
