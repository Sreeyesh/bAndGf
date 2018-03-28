class CreateBoys < ActiveRecord::Migration[5.1]
  def change
    create_table :boys do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :null => false
      t.boolean :restricted, :null => false, :default => false
      t.timestamps
    end
  end

  def self.up
  	create_table :boys do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email, :nall => false

      t.timestamps
    end
  end

  def self.down
  	drop_table :boys
  end
end
