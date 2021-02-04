class CreateDones < ActiveRecord::Migration[5.2]
  def change
    create_table :dones do |t|
      t.integer :user_id
      t.integer :goal_id

      t.timestamps
    end
  end
end
