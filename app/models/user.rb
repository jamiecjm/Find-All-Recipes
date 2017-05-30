class User < ApplicationRecord
	mount_uploader :avatar, AvatarUploader

	has_many :recipes
	has_many :favourites
	
	has_secure_password

	before_save :titleize

	def titleize
		self.name = self.name.titleize if self.name.present?
	end
	
end
