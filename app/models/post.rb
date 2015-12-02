class Post < ActiveRecord::Base
  has_many :uploads, dependent: :destroy
  belongs_to :user

  has_many :favs, dependent: :destroy


  CATEGORIES = ["Société", "Culture", "Science", "Arts", "Médias", "Finance", "Economie"]
  STATUS = ["Publié", "Brouillon"]
  LICENCE = ["Copyright", "Creative Commons", "Libre"]

  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true
  # validates :introduction, presence: true
  validates :content, presence: true
  validates :synopsis, length: { maximum: 200 }, presence: true
  # validates :city, presence: true
  validates :category, inclusion: { in: Post::CATEGORIES, allow_nil: false }
  validates :status, inclusion: { in: Post::STATUS, allow_nil: false }
  validates :price_cents, presence: true
  validates :licence, presence: true, inclusion: { in: Post::LICENCE, allow_nil: false }

  mount_uploader :cover, ImageUploader

  geocoded_by :city
  after_validation :geocode

  include PgSearch
  pg_search_scope :search,
    against: [ :title, :synopsis, :content, :city ],
    associated_against: {
      uploads: [ :description ]
    }

  def is_faved_by(user)
    self.favs.where(user: user).take
  end
end
