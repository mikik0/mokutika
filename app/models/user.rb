class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]
  has_one_attached :icon
  has_many :follows, dependent: :destroy
  has_many :goals, through: :follows

  validates :name, presence: true, uniqueness: true

  # userが投稿者かどうか
  def owner?(goal_id)
    goal = follows.find_by(goal_id: goal_id)
    goal.present? && goal.is_owner
  end

  # No use email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
