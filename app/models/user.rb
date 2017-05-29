class User < ApplicationRecord
	mount_uploader :avatar, AvatarUploader

	has_many :recipes
	
	has_secure_password
end
