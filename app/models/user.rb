class User < ApplicationRecord
	mount_uploader :avatar, AvatarUploader

	has_many :recipes
	has_many :favourites
	has_many :authentications, dependent: :destroy
	
	has_secure_password

	before_save :titleize

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	def titleize
		self.name = self.name.titleize if self.name.present?
	end

    def self.create_with_auth_and_hash(authentication, auth_hash)
      byebug
      user = self.new(
        name: auth_hash["info"]["name"],
        email: auth_hash["extra"]["raw_info"]["email"],
        avatar: auth_hash["info"]["image"]
      )
      user.save(validate: false)
      user.authentications << authentication
      return user
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end
	
end
