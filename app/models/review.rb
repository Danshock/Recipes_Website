class Review < ApplicationRecord
	belongs_to :recipe
	belongs_to :user

	validates :comment, presence: true, length: { minimum: 2, maximum: 320 }
	validates :rating, presence: true
end
