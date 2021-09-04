class Goal < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validate :deadline_check
  belongs_to :user
  has_many :dones, dependent: :destroy
  has_many :done_users, through: :dones, source: :user
  has_many :follows, dependent: :destroy
  has_many :follow_users, through: :follows, source: :user

  def deadline_check
    errors.add(:deadline, "は現在より前の日付で登録できません。") if
      self.deadline < Time.current
  end
end
