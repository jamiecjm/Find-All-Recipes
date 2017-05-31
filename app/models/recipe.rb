class Recipe < ApplicationRecord
	mount_uploader :food_photo, FoodUploader
	include PgSearch
	multisearchable :against => [:title]

	belongs_to :user, optional: true
	has_many :ingredients
	has_many :instructions
	has_many :favourites
	belongs_to :cuisine, optional: true
	belongs_to :main_ingredient, optional: true
	accepts_nested_attributes_for :ingredients, allow_destroy: :true, reject_if: :all_blank
	accepts_nested_attributes_for :instructions, allow_destroy: :true, reject_if: :all_blank

  	before_save :titleize

    def titleize
      self.title = self.title.titleize if self.title.present?
    end

end
