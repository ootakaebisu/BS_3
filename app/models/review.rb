class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :good_reviews, dependent: :destroy
  def good_review_by?(user)
    good_reviews.where(user_id: user.id).exists?
  end
end
