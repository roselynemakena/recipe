class CreateRecipeItems < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_items do |t|
      t.integer :recipe_id
      t.integer :item_id
    end
  end
end
