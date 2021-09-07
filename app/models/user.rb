class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorite_authors, dependent: :destroy
  has_many :book_statuses, dependent: :destroy
  has_many :favorite_books, dependent: :destroy
  has_many :reviews, dependent: :destroy


end
