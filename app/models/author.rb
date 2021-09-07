class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  has_many :favorite_authors, dependent: :destroy
  def favorite_author_by?(user)
    favorite_authors.where(user_id: user.id).exists?
  end
end
