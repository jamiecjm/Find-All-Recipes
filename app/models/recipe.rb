class Recipe < ApplicationRecord
	mount_uploader :food_photo, FoodUploader

	belongs_to :user, optional: true
	has_many :ingredients
	has_many :instructions
	belongs_to :cuisine, optional: true
	belongs_to :main_ingredient, optional: true
	accepts_nested_attributes_for :ingredients, allow_destroy: :true
	accepts_nested_attributes_for :instructions, allow_destroy: :true


end
