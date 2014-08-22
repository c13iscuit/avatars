class Image < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :url
  validates_presence_of :user_id
end
