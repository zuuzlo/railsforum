class CreateCategoriesPosts < ActiveRecord::Migration
  def up
    create_table :category_posts do |t|
      t.integer :category_id, :post_id

      t.timestamps
    end
  end

  def down
    drop_table :categories_posts
  end
end
