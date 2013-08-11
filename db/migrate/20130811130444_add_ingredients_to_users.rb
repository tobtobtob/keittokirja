class AddIngredientsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ingredients, :text
  end
end
