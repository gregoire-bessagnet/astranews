class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.text :description
      t.string :photo
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
