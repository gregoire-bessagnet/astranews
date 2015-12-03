class RemovePriceFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :price, :monetize
  end
end
