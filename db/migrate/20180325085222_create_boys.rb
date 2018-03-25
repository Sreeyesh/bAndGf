class CreateBoys < ActiveRecord::Migration[5.1]
  def change
    create_table :boys do |t|
      t.string :first_name, :naull => false
      t.string :last_name, :naull => false
      t.string :email, :naull => false

      t.timestamps
    end
  end

  def self.up
  	create_table :boys do |t|
      t.string :first_name, :naull => false
      t.string :last_name, :naull => false
      t.string :email, :naull => false

      t.timestamps
    end
  end

  def self.down
  	drop_table :boys
  end
end
