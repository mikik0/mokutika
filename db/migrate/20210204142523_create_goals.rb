class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.datetime :deadline

      t.timestamps
    end
  end
end
