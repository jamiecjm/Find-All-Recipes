class Recipe < ApplicationRecord
	mount_uploader :food_photo, FoodUploader
	include PgSearch
	multisearchable :against => [:title]
	paginates_per 18

	belongs_to :user, optional: true
	has_many :ingredients, dependent: :destroy
	has_many :instructions, dependent: :destroy
	has_many :favourites, dependent: :destroy
	belongs_to :cuisine, optional: true
	belongs_to :main_ingredient, optional: true
	accepts_nested_attributes_for :ingredients, allow_destroy: :true, reject_if: :all_blank
	accepts_nested_attributes_for :instructions, allow_destroy: :true, reject_if: :all_blank

  	before_save :titleize

  	validates :title, presence: true

    def titleize
      self.title = self.title.titleize if self.title.present?
    end

end
