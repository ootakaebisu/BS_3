class Book < ApplicationRecord
  belongs_to :author
  has_many :book_statuses, dependent: :destroy
end
