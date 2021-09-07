class Book < ApplicationRecord
  belongs_to :author
  has_many :book_statuses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :responses, dependent: :destroy

  has_many :favorite_books, dependent: :destroy
  def favorite_book_by?(user)
    favorite_books.where(user_id: user.id).exists?
  end

end
