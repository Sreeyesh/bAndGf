class CreateGirlFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :girl_friends do |t|
      t.integer :boy_id, :naull => false
      t.string :first_name, :naull => false
      t.string :last_name, :naull => false
      t.string :email, :naull => false

      t.timestamps
    end
  end
end
