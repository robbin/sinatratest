class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name,      :null => false, :limit => 30
      t.boolean :gender
      t.integer :age,       :null => false, :default => 0
      t.date    :birthday,  :null => true
      t.string  :industry,  :null => false, :default => "Internet" 
      
      t.timestamps
    end
    
    add_index :users, :industry
  end
end
