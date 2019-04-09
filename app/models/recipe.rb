class Recipe < ApplicationRecord
	validates :title, presence: true, length: { minimum: 2, maximum: 80 }
	validates :description, presence: true, length: { minimum: 2 }
	validates :author, presence: true, length: { minimum: 2, maximum: 20 }
end
