class Ingredient < ApplicationRecord

	belongs_to :recipe, optional: true

	before_save :titleize

    def titleize
      self.ingredient = self.ingredient.titleize if self.ingredient.present?
    end
end
