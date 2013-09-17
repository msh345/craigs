class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.string :location
      t.integer :price
      t.timestamps
      t.integer :category_id
    end
  end
end
