class User < ActiveRecord::Base
  has_secure_password
  
  has_many :foodiepictures
  has_many :comments
  has_many :sessions
  
  has_attached_file :image
  validates_attachment_content_type :image, content_type:["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
