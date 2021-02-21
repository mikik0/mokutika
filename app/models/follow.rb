class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  validates_uniqueness_of :goal_id, scope: :user_id    # バリデーション（ユーザーと記事の組み合わせは一意）
# 同じ投稿を複数回お気に入り登録させないため。
end
