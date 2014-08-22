class User < ActiveRecord::Base
  has_many :images

  validates_presence_of :username
  validates_presence_of :avatar
end
