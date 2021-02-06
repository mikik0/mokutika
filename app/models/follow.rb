class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :done, dependent: :destroy
  has_many :done_users, through: :dones, source: :user
end
