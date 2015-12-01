class Upload < ActiveRecord::Base
  belongs_to :post
  validates :photo, presence: true
  mount_uploader :photo, ImageUploader


  include PgSearch
  multisearchable :against => [:description]

end
