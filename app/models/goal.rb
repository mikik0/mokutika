class Goal < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :follows, dependent: :destroy
  has_many :follow_users, through: :follows, source: :user
end
