class Post < ActiveRecord::Base
  belongs_to :user

  CATEGORIES = ["Société", "Culture", "Science", "Arts", "Médias", "Finance", "Economie"]

  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :content, presence: true
  validates :synopsis, length: {minimum:200}, presence: true
  validates :city, presence: true
  validates :category, inclusion: { in: Post::CATEGORIES, allow_nil: false }
  validates :price, presence: true
  validates :licence, presence: true

end
