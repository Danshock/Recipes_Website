class Recipe < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :reviews
	has_many :ingredients, inverse_of: :recipe
	has_many :directions, inverse_of: :recipe

	accepts_nested_attributes_for :ingredients, 
								  reject_if: :all_blank, 
								  allow_destroy: true

	# accepts_nested_attributes_for :ingredients,
	# 							  reject_if: proc { |attributes| attributes["name"].blank? }, 
	# 							  allow_destroy: true

	accepts_nested_attributes_for :directions,
								  reject_if: proc { |attributes| attributes["step"].blank? }, 
								  allow_destroy: true

	validates :title, presence: true, length: { minimum: 2, maximum: 80 }
	validates :description, presence: true, length: { minimum: 2 }

	has_attached_file :recipe_img, styles: { recipe_index: "250x350>", recipe_show: "325x475>" },
								   convert_options: { recipe_index: "-quality 100 -strip" }, 
								   default_url: "/images/:style/missing.png"
    validates_attachment_content_type :recipe_img, content_type: /\Aimage\/.*\z/
end
