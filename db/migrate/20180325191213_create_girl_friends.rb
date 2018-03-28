class CreateGirlFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :girl_friends do |t|
      t.integer :boy_id, :nall => false
      t.string :first_name, :nall => false
      t.string :last_name, :nall => false
      t.string :email, :nall => false

      t.timestamps
    end
  end
end
