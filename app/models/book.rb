class Book < ActiveRecord::Base
	has_many :book_genres
	has_many :genres, through: :book_genres
	has_many :book_users
	has_many :users, through: :book_users
end