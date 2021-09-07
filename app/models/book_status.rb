class BookStatus < ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: { check: 0, read: 1, finish: 2 }

end
