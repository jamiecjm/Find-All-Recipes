class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string	:email
    	t.string	:name
    	t.string	:avatar
      t.integer :role
    	t.string	:password_digest
    	t.string	:reset_password_token
      t.timestamps
    end

    add_index :users, [:name]
  end
end
