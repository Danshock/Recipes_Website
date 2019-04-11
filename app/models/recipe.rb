class Recipe < ApplicationRecord
	belongs_to :user

	validates :title, presence: true, length: { minimum: 2, maximum: 80 }
	validates :description, presence: true, length: { minimum: 2 }
end
