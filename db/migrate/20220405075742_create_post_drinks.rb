class CreatePostDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :post_drinks do |t|

      t.integer :user_id
      t.string :name
      t.string :introduction
      t.string :genre

      t.timestamps
    end
  end
end
