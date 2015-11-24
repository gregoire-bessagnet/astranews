class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :introduction
      t.text :content
      t.date :date
      t.text :synopsis
      t.string :status
      t.string :category
      t.integer :character_number
      t.string :city
      t.float :price
      t.string :licence
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
