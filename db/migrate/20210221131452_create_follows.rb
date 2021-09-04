class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :user_id, foreign_key: true
      t.integer :goal_id, foreign_key: true
      t.boolean :is_owner, default: false
      t.boolean :is_finished, default: false

      t.timestamps
    end
  end
end
