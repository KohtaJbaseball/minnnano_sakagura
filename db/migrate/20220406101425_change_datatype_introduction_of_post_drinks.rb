class ChangeDatatypeIntroductionOfPostDrinks < ActiveRecord::Migration[6.1]
  def change
    change_column :post_drinks, :introduction, :text
  end
end
