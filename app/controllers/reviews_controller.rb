class ReviewsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    review = current_user.reviews.new(review_params)
    review.book_id = book.id
    review.save
    redirect_back(fallback_location: root_path)
  end

  def update
    book = Book.find(params[:book_id])
    review = book.reviews.find(params[:id])
    review.update(review_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    review = book.reviews.find(params[:id])
    review.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def review_params
    params.require(:review).permit(:text)
  end

end
