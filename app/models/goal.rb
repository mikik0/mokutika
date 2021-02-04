class Goal < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :dones, dependent: :destroy
  has_many :done_users, through: :dones, source: :user
end
