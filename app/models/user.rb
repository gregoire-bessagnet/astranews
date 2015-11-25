class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy

  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :speciality, presence: true

end
