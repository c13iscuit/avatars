class User < ActiveRecord::Base
  attr_accessor :password
  has_many :images

  before_save :encrypt_password

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password, on: :create
  validates_confirmation_of :password
  validates_presence_of :avatar

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
