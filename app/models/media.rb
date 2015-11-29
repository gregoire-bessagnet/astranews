class Media < ActiveRecord::Base
  belongs_to :posts
  validates :photo, presence: true
  mount_uploader :photo, ImageUploader
end
