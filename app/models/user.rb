class User < ActiveRecord::Base
  attr_accessor :password
  has_many :images

  before_save :encrypt_password

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates_presence_of :avatar

  mount_uploader :avatar, AvatarUploader

  def self.authenticate(username, password)
    user = User.find_by username: username
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # def add_image
  #   img = Image.new(
  #     url: "/uploads/user/avatar/#{self.id}/#{self.avatar.filename}",
  #     user_id: self.id)
  #   img.save
  # end
end
