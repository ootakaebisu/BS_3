class GoodReviewsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    review = book.reviews.find(params[:review_id])
    good_review = review.good_reviews.new(user_id: current_user.id)
    good_review.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    review = book.reviews.find(params[:review_id])
    good_review = review.good_reviews.find_by(user_id: current_user.id)
    good_review.destroy
    redirect_back(fallback_location: root_path)
  end
end
