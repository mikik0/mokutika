class Done < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  belongs_to :follow
end
