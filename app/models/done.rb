class Done < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  belongs_to :follow
  validates_uniqueness_of :goal_id, scope: :user_id
end
