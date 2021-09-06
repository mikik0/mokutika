class Goal < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validate :deadline_check

  has_many :follows, dependent: :destroy
  belongs_to :user, optional: true #外部キーのnullを許容する

  def deadline_check
    errors.add(:deadline, "は現在より前の日付で登録できません。") if
      self.deadline < Time.current
  end

  def current_goal?
    deadline > Time.now
  end
end
