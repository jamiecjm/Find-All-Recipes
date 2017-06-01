class User < ApplicationRecord
   
  mount_uploader :avatar, AvatarUploader

  has_many :recipes, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :authentications, dependent: :destroy
  
  has_secure_password

  before_save :titleize

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  # validates :password_confirmation, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  enum roles: ["Admin","User"]

  attr_accessor :original_password
  
  def titleize
    self.name = self.name.titleize if self.name.present?
  end

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.new(
      name: auth_hash["info"]["name"],
      email: auth_hash["extra"]["raw_info"]["email"],
      remote_avatar_url: auth_hash["info"]["image"]+"?type=large"
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
