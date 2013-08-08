class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :passw_salt
      t.string :passw_hash
      t.text :user_info

      t.timestamps
    end
  end
end
