class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :email,              null: false
      t.string :user_name,          null: false
      t.string :password,           null: false
      t.string :phone,              null: false
      t.integer :role,              null: false, default: 0
      t.timestamps,                 null: false
    end
    add_index :users, :email,                    unique: true
    add_index :users, :user_name,                unique: true
  end
end
