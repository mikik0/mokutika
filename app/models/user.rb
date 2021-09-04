class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]
  has_one_attached :icon
  has_many :goals, dependent: :destroy
  has_many :follows, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
